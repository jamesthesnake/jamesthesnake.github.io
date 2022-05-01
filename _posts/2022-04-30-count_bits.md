---
layout: post
title: "Count Bits Weird"
date: 2022-04-30
---
Counting set bits in an interesting way
=======================================


This is not the fastest but maybe the most interesting way to count
how many bits are 1 in a binary number.

This is it:

    unsigned popcnt(unsigned x) {
        unsigned diff = x;
        while (x) {
            x >>= 1;
            diff -= x;
        }
        return diff;
    }

Most people would probably extract only the lowest bit in each
iteration and add only that bit to a sum.  As you can see here, you
don't need to do that and this solution is one instruction shorter per
iteration.

So how does it work?  First, it's easier to understand if we think
about it as calculating a sum that we then subtract instead of
calculating the difference directly.  Assume the code is written like
this:

    unsigned popcnt(unsigned x) {
        unsigned sum = 0;
        unsigned remaining = x;
        while (remaining) {
            remaining >>= 1;
            sum += remaining;
        }
        return x - sum;
    }

Now you can see that the code calculates:

    sum = x/2 + x/4 + x/8 + ...

and then returns x - sum.  It may be familiar that:

    x/2 + x/4 + x/8 + ... == x

and that is true, but only for real numbers, not integers.  When we do
this calculation with integers, we lose the sub-integer part for each
bit that falls off in the bitshift.  The sub-integer part for each bit
equals:

    1/2 + 1/4 + 1/8 + ... == 1

That means that for each bit that is shifted off the edge, we lose 1
to the sum.  That means that the difference between the calculated sum
and the mathematical sum equals the number of set bits.

---

The interesting thing about this algorithm is that we calculate
something that we can't calculate directly, by calculating everything
except for that, and then looking at the difference.
