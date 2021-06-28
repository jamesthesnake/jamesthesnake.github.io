---
layout: post
title: "Compilers undefined signed overflow"
date: 2021-06-28
---

Why do compilers even bother with exploiting undefinedness signed overflow? And what are those
mysterious cases where it helps?

A lot of people (myself included) are against transforms that aggressively exploit undefined behavior, but
I think it's useful to know what compiler writers are accomplishing by this.

TL;DR: C doesn't work very well if int!=register width, but (for backwards compat) int is 32-bit on all
major 64-bit targets, and this causes quite hairy problems for code generation and optimization in some
fairly common cases. The signed overflow UB exploitation is an attempt to work around this.

To be more precise: the #1 transform that compilers really want to get out of this is to replace int32
loop counters with int64 loop counters in 64-bit code whenever possible, because int32s are bad news
for the purposes of memory access and address generation.

To show the actual problem, let's look at a simple loop:

  int x[N]; // initialized elsewhere
  sum = 0;
  for (int i = 0; i < count; ++i)
    sum += x[i];
    
which can be naively compiled (on x86-64) into something like:

    ; ecx = count
    ; rsi = points to x[]
    xor    eax, eax    ; clear sum
    test   ecx, ecx
    jng    done        ; don't even enter loop if count <= 0
    xor    ebx, ebx    ; i
  lp:
    movsxd rdx, ebx    ; * sign-extend i to 64 bits
    add    eax, [rsi+rdx*4] ; sum += x[i]
    inc    ebx         ; ++i
    cmp    ebx, ecx
    jl     lp
  done:

That MOVSXD (marked *) is indicative of the issue: we're on a 64-bit machine trying to use a 32-bit index to
refer to an array, and because addresses are 64-bit (and we could absolutely have an array larger than 4GB but
with less than 2 billion entries), we need to sign-extend that index to 64-bit before we can do our addressing
calculation.

That sign-extend is extra work in the inner loop that would not exist in the 32-bit version of this snippet.
It also causes other problems. For example, the 32-bit equivalent of the code above always accesses memory at

  esi + ebx*4
  
and ebx is what's called an "induction variable" - it changes by a constant value in every loop iteration
(incrementing by 1 in this case). A 32-bit compiler can realize this and replace it with pointer arithmetic
(incrementing esi by 4 every iter, say). "esi" and "ebx" are both 32-bit values subject to 32-bit wraparound,
but since we're working modulo 2^32 anyway, this is not a problem.

A 64-bit compiler needs to work with the less friendly address

  rsi + sext32to64(ebx)*4

with a sign extend in the middle (that "sext32to64(ebx)" is what the "movsxd rbx, edx" does). And in
particular, should ebx ever overflow from 0x7fffffff to -0x80000000, the resulting address will change
dramatically, by (4 - 2^(32+2)). In 32-bit mode (all addresses modulo 2^32), this is just an increase by 4
as usual; the "wraparound" part is a multiple of 2^32 and hence invisible. In 64-bit mode, it isn't; if the
compiler wants to turn this into address arithmetic, it needs to either:
a) prove that "i" can never overflow/wrap around in this loop,
b) insert extra code that detects wrap-around of "i" and adjusts the addresses accordingly,
c) not use pointer arithmetic and recompute addresses every time (as in the example).

Option a) is relatively straightforward in this particular example, but it can get hairy, and my point is
that 32-bit compilers never need to worry about any of this to begin with (and neither do 64-bit compilers
when dealing with 64-bit integer indices).

And if the compiler *isn't* able to do these proofs, it can get pretty bad. For example, the loop above
is basically all loop overhead, and most compilers will end up unrolling (or vectorizing, but I'll
ignore that) it. Now we'd prefer to see an inner loop like: (I won't show the setup or tail loop here):

  lp:
    add    eax, [rsi+0]    ; sum += x[i+0]
    add    eax, [rsi+4]    ; sum += x[i+1]
    add    eax, [rsi+8]    ; sum += x[i+2]
    add    eax, [rsi+12]   ; sum += x[i+3]
    add    rsi, 16         ; ptr += 4
    dec    ecx             ; (trip count in ecx, was calculated outside loop)
    jnz    lp
    
(only showing the adressing parts here, in practice there's other transforms we'd like to see too, but
let's stay focused.)

If the compiler can't (for whatever reason) prove that the index expressions are not going to overflow
as 32-bit values, it needs to do something much worse like:

  lp:
    movsxd rdi, ebx         ; sext32to64(i)
    add    eax, [rsi+rdi*4]
    lea    edi, [ebx+1]     ; i+1
    movsxd rdi, edi
    add    eax, [rsi+rdi*4]
    lea    edi, [ebx+2]
    movsxd rdi, edi
    add    eax, [rsi+rdi*4]
    lea    edi, [ebx+3]
    movsxd rdi, edi
    add    eax, [rsi+rdi*4]
    add    ebx, 4
    cmp    ebx, ecx         ; (precomputed spot to stop 4x unrolled iters)
    jl     lp
    
This is a silly example, but all you need to do is look at some assembly listings for
generated x64 code for hot loops with two's complement overflow semantics and search for
"movsxd"; usually you'll be able to find actual addressing code that does stuff like this
in less than a minute.

Anyway, as said, compilers use the signed-overflow UB as a free ticket to promote int32
loop counters to int64, which fixes this type of problem (and introduces exciting new
problems, especially when it's applied to all signed integer arihtmetic and not cases
like these loop counters where there's actually a specific reason).

But really the core issue is that all of C's semantics (everything narrower auto-widened
to int etc.) work pretty well when "int" is the width of machine registers and pretty
badly when it's not. Newer languages (e.g. Go and Rust) solve this problem by just making
"int" be 64-bit on 64-bit platforms, which removes most of the motivation for this kind
of thing.

What I'd *like* to see compilers spend time on is:
a) you can do profile-guided optimizations; what about profile-guided performance warnings?
   Eating the sign extends (and resulting extra work) on cold code is not *that* bad if
   there's a way for the compiler to tell the programmer about the hot loops that really
   should probably use a different loop counter type.
b) decreasing cost of sign extends. Note that my examples allocate a different register
   for the sign-extended quantities, increasing register pressure. This is typical and
   often as much (or more) of a problem than the extra instructions. On x64, it is in
   fact fine and often preferable to sign-extend a 32-bit register to itself:
   
     movsxd rbx, ebx
     
   or similar. The top 32 bits of "rbx" will get zero-cleared the next time a 32-bit ALU
   op writes to ebx, but that's fine. At least we didn't use an extra register.
c) compilers already expend a lot of effort on theorem prover-style analysis that can
   e.g. show when overflows can't happen in a loop such as the example loop (in this
   case: if we can prove "count" stays fixed throughout the loop, we only enter the loop
   if "0 < count", and we only stay in the loop until "i >= count"; with i increasing at
   a rate of 1 per iteration, this is guaranteed to happen before i overflows). This is
   a powerful tool for enabling better optimizations (like transitioning to address
   arithmetic in this loop). Unfortunately it's also pretty much a black box to the
   programmer, and it can be really hard to understand what the compiler can or cannot
   prove at any given point in time. So it's tricky. Better analysis catches more and
   more cases, but when it doesn't work, it fails badly.
   
   If in doubt, it's almost always preferable to have semantics defined in such a way
   that you don't *need* a theorem-prover to generate efficient code. (Easier said
   than done in some cases!)
   
Anyway, what you can do?

If you're a compiler writer:
- Don't copy C's backwards-compat compromise that caused this mess. Make sure that your
  idiomatic loop counter is register width.
  
  Basically, the less common these sign extends are on critical paths, the less pressure
  there is to do questionable things to make them faster.
  
If you're someone writing C/C++ code: It depends on the platform. On x86-64, 32-bit
arithmetic ops are all zero-extending. So anything that works with uint32s is fine.
ARM AArch64 likewise has 32- and 64-bit variants of everything, *and* some fairly good
sign/zero-extend support for narrower types built in, even in addresssing calculations.
This helps reduce these costs. On 64-bit PowerPC/POWER, you only get 64-bit versions
of many arithmetic operations, and your life sucks no matter what. You really want to
be working with 64-bit integer types whenever possible on these machines.

On most of the machines you're likely to use, "size_t" for loop counters is a good idea
where signed values aren't required. It's unsigned and generally as wide as addresses,
so there's normally no extra code for zero/sign extends, and the type is standard.

