---
layout:     post
title:      Optimization
date:       2022-04-30
summary:    optimization
categories: Optimization
---

Multi-variable optimization is about finding minima of functions that take many inputs and produce a single output. Given a real valued function f ⁣:Rn→Rf\colon \mathbb{R}^{n} \rightarrow \mathbb{R}f:Rn→R, we want to find a point a=(a1,…,an)∈Rna = (a_{1}, \ldots, a_{n}) \in \mathbb{R}^na=(a1​,…,an​)∈Rn so that f(a)≤f(x)f(a) \leq f(x)f(a)≤f(x) for all xxx, or at least the xxx in some region.

An optimizer is an algorithm that attempts to do this automatically. It intelligently tests many different variable assignments until it finds one that minimizes fff. Later, we will provide more detail about how it works and identify a few mathematical requirements for fff that allow it to be optimized.

So, how can optimization help our drawing project? As mentioned before, optimization is useful for solving problems where you know what you want, but not all the steps to get there. First, we need a model of the problem. You may already have one in the form of a black box. This may be a piece of code or a physical system, and you just want it to behave a certain way. Otherwise, you may have an intuitive idea of a problem and need to construct your own model. The important part is describing all the variables at play (there may be hundreds!) and how they relate. With a good model, solving the problem is then a manner of finding inputs that give the intended results.

So, how do we configure all the variables in the models to get the desired outcome? Depending on the problem, you may be able to solve it directly, like the math and physics homework practiced in school. But, with optimization, all we have to do is describe what a good configuration looks like. We do this by defining a cost or preference function that takes all the variables as input and measures how well they match our desired outcome. This is the function f ⁣:Rn→Rf \colon \mathbb{R}^{n} \rightarrow \mathbb{R}f:Rn→R that we will eventually want to optimize.

The idea is to define the cost function fff carefully, such that the variables that minimize f will also be good solutions to our application. This is harder than it sounds. It’s always difficult to express an intuitive idea in a precise quantitative manner. Often you think you want one thing, only to learn you actually need something else entirely. But, with a little thought and experimentation, we can become confident that fff expresses what we want.
