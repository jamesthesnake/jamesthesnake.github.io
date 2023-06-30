The gamma function is defined by the following integral, which converges for real 𝑠>0
s
>
0
:
Γ(𝑠)=∫∞0𝑡𝑠−1𝑒−𝑡𝑑𝑡.
Γ
(
s
)
=
∫
0
∞
t
s
−
1
e
−
t
d
t
.

The function can also be extended into the complex plane, if you're familiar with that subject. I'll assume not and just let 𝑠
s
 be real.

This function is like the factorial in the when 𝑠
s
 is a positive integer, say 𝑠=𝑛
s
=
n
, it satisfies Γ(𝑛)=(𝑛−1)!
Γ
(
n
)
=
(
n
−
1
)
!
. It generalizes the factorial in the sense that it is the factorial for positive integer arguments, and is also well-defined for positive rational (and even real) numbers. This is what it means to take a "rational factorial," but I would hesitate to call it that. Many functions have those two properties, and Γ
Γ
 is chosen out of all of them because it is the most useful in other applications. Rather than the notation used in that article you refer to, it would be more accurate for you to say that "the gamma function takes these values for these arguments." Gamma is not a function that intends to generalize factorials; rather, generalizing factorials came along as something of an accident following the definition. Its true purpose is deeper.

As for why Γ(1/2)=𝜋‾‾√
Γ
(
1
/
2
)
=
π
, this comes out of an interesting property of the Γ
Γ
 function: some of them are here http://en.wikipedia.org/wiki/Gamma_function#Properties. The property you are interested in is the reflection formula:
Γ(1−𝑧)Γ(𝑧)=𝜋sin(𝜋𝑧).
Γ
(
1
−
z
)
Γ
(
z
)
=
π
sin
⁡
(
π
z
)
.
Set 𝑧=1/2
z
=
1
/
2
 in the formula to get the desired identity.

If you want to learn more about the gamma function, the hard way is to learn a lot more math, in particular real and complex analysis. An easier way is to read this excellent set of notes: http://www.sosmath.com/calculus/improper/gamma/gamma.html.
