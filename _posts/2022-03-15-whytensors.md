---
layout:     post
title:      why Tensors?
date:       2022-03-15
summary:    Why tensors
categories: hardware vertical-intergration IBM s
---

I’ve been working through Leonard Susskind’s The Theoretical Minimum course, and one thing I’ve found interesting is the ubiquity of tensors - they seem to pop up everywhere in physics. I’ve been trying to build some intution behind what makes them so widely applicable, and I wanted to share my notes on this in the hopes that others might also find this useful. I’d also welcome any insights or corrections.

Most commonly, a tensor is defined as being anything that transforms like a tensor. Specifically, a tensor 
T
 is a bunch of numbers, one for each coordinate (in whatever coordinate system you’re using), such that if you change coordinates from 
x
 to 
x
′
, the components of 
T
 (i.e., the numbers that make up 
T
) transform according to the tensor transformation law.

T
′
ν
=
δ
x
′
ν
δ
x
μ
T
μ
Where 
ν
 and 
μ
 label indices of 
T
′
 and 
T
 (both of rank 1 - this isn’t the more general transformation law), respectively.

I don’t want to dig into this too much for now, because although this is the definition that tends to be the most useful in practice, I haven’t found it too helpful for building more intuition for where tensors come from. That said, this definition does point to something crucial - transformations.

Let’s start by asking the question - why would a transformation property be the defining property of an object, i.e., why would we want some object 
T
 (a tensor) to transform if the underlying coordinates used to define that object change?

The idea here is that we want to represent an object that doesn’t depend on the coordinates that someone chooses to make measurements. If I make measurements in polar coordinates and you make them in cartesian coordinates, we should both be able to perform calculations and come up with the same result - the laws of physics should not depend on systems of coordinates. So if I make some measurements in my coordinate system and then change those coordinates a bit, then my measurements, the components of 
T
, should change in a way such that they always represent the same object.

