---
layout:     post
title:      Math divisor
date:       2022-12-18
summary:    Math Divisior
categories: Math Divisor 
---

Taken from https://kavigupta.org/2021/08/07/BAN-ALL-AMBIGUOUS-MATHEMATICAL-EXPRESSIONS/ so I never forget

If you’re on twitter or Facebook you’ve probably seen this expression (or a variant with different numbers) before

6 ÷ 2(1+2)
The question that goes with it is “can you solve this?” and there’s usually a massive debate among people in the comments about whether the answer is 9 (corresponding to dividing first then multiplying by (1+2)) or 1 (corresponding to multiplying first to get 6 then dividing).

Order of Operations
One thing people often seem to be arguing about is PEMDAS/BODMAS: the system of precedence used to do these operations. The acronyms suggest a sequencing of multiplication and division, but the convention taught with them is that the two operations have equal precedence and should be left associatively evaluated. So the formula would parse as (6 ÷ 2)(1+2) and thus be equal to 9.

One common response to this from mathematicians and other more sophisticated observers is that people are arguing about a completely arbitrary convention, and really you should just parenthesize better. These folks are correct, but I think they’re missing something that makes this particular example unique. For example, I think most people would correctly recall and apply the PEMDAS rule to the formula

6 - 1 + 3
I think most people would even correctly apply the rule to the formula

6 ÷ 2 × (1 + 3)
There’s something unique about this formula that means that PEMDAS does not apply to it.

The implicit multiplication operator
If you saw the following equation, how would you parenthesize it?

T = PV/nR
I think most people would correctly parenthesize this as T = (PV)/(nR) not T = P(V/n)R.

Most folks would say you should probably still parenthesize to be sure, but many people would casually just write PV / nR and be understood by 100% of their target audience. In a textbook you’d write PVnR
 and that’s how the mind reads it.

There’s even some cases where a textbook would actually use the / operator!

If you’ve taken an abstract algebra class, you’ve seen a function type written as something like

f : Z/2Z × Z/2Z -> Z
Ignoring the arrow and colon (which have lower precedence than everything else), we have the type

Z/2Z × Z/2Z
which represents a pair of integers modulo 2. The correct parenthesization of this type is thus

(Z/(2Z))×(Z/(2Z))
Note that we don’t actually use the standard left-to-right PEMDAS rule here, nor do we prioritize multiplication over division. Instead, we have the following precedence: implicit multiplication, / division, then × multiplication.

The division bar
Ok so we’ve established that the precedence rule for division and implicit multiplication is such that implicit multiplication works differently from × multiplication. We’ve also kinda justified that the answer should really be 1 by standard conventions in higher math

The thing is that the division bar is a really weird object – it isn’t actually used much outside of elementary school mathematics. Typically outside that context either a full division bar 23
 or an inline division bar /. That means that in practice there’s no actual convention about the relationship between ÷ and the implicit multiplication operator.

Conclusion / TLDR
The expression 6 ÷ 2(1+2) is probably the most controversial mathematical expression out there. It is capable of being interpreted differently even among people who definitely understand the standard conventions of mathematical symbology intuitively and fluently.

It is not just a normal level of unnecessarily confusing, it is adversarial in it’s confusingness.

