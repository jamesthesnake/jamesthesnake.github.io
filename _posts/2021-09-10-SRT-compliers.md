---
layout:     post
title:      SRT compilers
date:       2021-09-10
summary:    SRT algo for compilers
categories: Compilers,SRT
---
To help better understand the flaw, we have attached a brief introduction to the SRT division technique.

The SRT divide algorithm can basically be described in steps as:

1. Sample the most significant digits of the divisor and dividend.

2. Use the samples as indexes into a lookup table to get a guess of the next quotient digits. (in this case the quotient guess can be -2, -1, 0, +1, +2).

3. Multiply the divisor by the quotient guess and subtract it from dividend (Note that this is an addition if the quotient guess was negative).

4. Save the quotient digits in the least significant digits of a quotient register.

5. Shift the remainder left by 2 and shift the quotient registers left by 2 (i.e. radix 4)

6. Sample the most significant digits of the new shifted partial remainder.

7. Go to step 2 unless you have generated enough significant quotient digits.

8. Generate the binary quotient by assembling the values in the quotient register.

9. If the last partial remainder was negative then adjust the quotient by subtracting the value. 
