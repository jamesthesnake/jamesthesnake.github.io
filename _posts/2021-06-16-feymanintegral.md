---
layout:     post
title:      Feymans intergral
date:       2021-06-16
summary:    Feymans Intergral
categories:
---

Post Feymans Integral here!


<br>
“I had learned to do integrals by various methods shown in a book that my high school physics teacher Mr. Bader had given me. [It] showed how to differentiate parameters under the integral sign — it’s a certain operation. It turns out that’s not taught very much in the universities; they don’t emphasize it. But I caught on how to use that method, and I used that one damn tool again and again. [If] guys at MIT or Princeton had trouble doing a certain integral, [then] I come along and try differentiating under the integral sign, and often it worked. So I got a great reputation for doing integrals, only because my box of tools was different from everybody else’s, and they had tried all their tools on it before giving the problem to me.” (Surely you’re Joking, Mr. Feynman!)

<\n>
  
<br>
Today’s article is going to discuss an obscure but powerful integration technique most commonly known as differentiation under the integral sign, but occasionally referred to as “Feynman’s technique” due to his popularization of this technique in his book, and properly known as the Leibniz Integral Rule.
One point of clarification before we begin: While the Leibniz Rule is sometimes known as “Feynman’s technique” or similar names, it is not to be confused with Feynman’s path integral formulation of quantum mechanics. Hence for the rest of this article, I will refer to it by its proper name.

<break>
Let’s start with the problem of computing the following integral:
The book that Feynman mentions in the above quote is Advanced Calculus published in 1926 by an MIT mathematician named Frederick S Woods, this integral comes from that book, and is reproduced on Wolfram Mathworld.
<br>
You can try the usual techniques that you learn in calculus. Trig substitution, change of variable, integration by parts, replacing the integrand with a series, none of it will work. You can also try having Wolfram Alpha compute it, and it will time out. We will need to be more creative.
You should first observe that alpha is an arbitrary constant with respect to the integral. Since the definite integral will be a number that depends on alpha, we may treat this integral as a function of alpha. The outline of the approach is as follows:
<br>
$$\int_0^pi ln(1-2\alphacosx+\alpha^2 \,dx for \abs\alpha >= 1

  $$\lambda^\prime = -\frac{df}{du}^\ast \lambda + \left(\frac{dg}{du} \right)^\ast$$
Consider the integral as a function f of alpha
Compute the integral for some particular convenient value of alpha. In this case,
<br>

 if alpha is equal to one, then the integral is equal to zero, which gives us the condition f(1) = 0. 
 <br>
 We will need this for the last step.
Differentiate the integral with respect to alpha.
<br>
Compute the definite integral with respect to x.
Integrate indefinitely with respect to alpha.
<br>
TEST When \(a \ne 0\), there are two solutions to \(ax^2 + bx + c = 0\) and they are
$$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$
<br>

Use the fact that f(1) = 0 to compute the value of the constant of integration.
<br>
What we have done is we have transformed the problem from computing an integral into solving a simple differential equation. Observe:
<br>
$$\begin{eqnarray*}({p(h_t\vert v_{1:t})} \equiv \alpha(h_t) = p(v_t\vert h_t)\prod_{h_t}\alpha(h_{t-1})p(h_t\vert h_{t-1})\end{eqnarray*}$$
$$\beign LET
