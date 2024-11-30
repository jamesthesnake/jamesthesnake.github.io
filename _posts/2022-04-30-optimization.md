---
layout:     post
title:      Optimization
date:       2022-04-30
summary:    optimization
categories: Optimization
---


# Multi-Variable Optimization: A Practical Guide

Multi-variable optimization is about finding minima of functions that take many inputs and produce a single output. Given a real valued function *f: ℝⁿ → ℝ*, we want to find a point *a = (a₁, ..., aₙ) ∈ ℝⁿ* so that *f(a) ≤ f(x)* for all *x*, or at least the *x* in some region.

An optimizer is an algorithm that attempts to do this automatically. It intelligently tests many different variable assignments until it finds one that minimizes *f*. Later, we will provide more detail about how it works and identify a few mathematical requirements for *f* that allow it to be optimized.

## How Can Optimization Help?

Optimization is useful for solving problems where you know what you want, but not all the steps to get there. First, we need a model of the problem. You may already have one in the form of a black box. This may be a piece of code or a physical system, and you just want it to behave a certain way. Otherwise, you may have an intuitive idea of a problem and need to construct your own model. The important part is describing all the variables at play (there may be hundreds!) and how they relate. With a good model, solving the problem is then a matter of finding inputs that give the intended results.

## Finding the Right Configuration

How do we configure all the variables in the models to get the desired outcome? Depending on the problem, you may be able to solve it directly, like the math and physics homework practiced in school. But, with optimization, all we have to do is describe what a good configuration looks like. We do this by defining a cost or preference function that takes all the variables as input and measures how well they match our desired outcome. This is the function *f: ℝⁿ → ℝ* that we will eventually want to optimize.

The idea is to define the cost function *f* carefully, such that the variables that minimize *f* will also be good solutions to our application. This is harder than it sounds. It's always difficult to express an intuitive idea in a precise quantitative manner. Often you think you want one thing, only to learn you actually need something else entirely. But, with a little thought and experimentation, we can become confident that *f* expresses what we want.
