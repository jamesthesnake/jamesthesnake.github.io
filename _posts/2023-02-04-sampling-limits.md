---
layout:     post
title:      Recurrent Neural Networks - The Intuition
date:       2023-02-12
summary:    In two minutes, what is a Recurrent Neural Network basically doing?
categories: machine-learning neural-networks drawing recurrent-neural-network
---

To accurately estimate the fraction of items with a given property, like M&Ms with Peter faces, each item must have the same chance of being selected, as each M&M did. Suppose instead that we had ten bags of M&Ms: nine one-pound bags with 500 M&Ms each, and a small bag containing the 37 M&Ms we used before. If we want to estimate the fraction of M&Ms with Peter faces, it would not work to sample by first picking a bag at random and then picking an M&M at random from the bag. The chance of picking any specific M&M from a one-pound bag would be 1/10 × 1/500 = 1/5,000, while the chance of picking any specific M&M from the small bag would be 1/10 × 1/37 = 1/370. We would end up with an estimate of around 9/370 = 2.4% Peter faces, even though the actual answer is 9/(9×500+37) = 0.2% Peter faces.

The problem here is not the kind of random sampling error that we computed in the previous section. Instead it is a systematic error caused by a sampling mechanism that does not align with the statistic being estimated. We could recover an accurate estimate by weighting an M&M found in the small bag as only w = 37/500 of an M&M in both the numerator and denominator of any estimate. For example, if we picked 100 M&Ms with replacement from each bag and found 24 Peter faces in the small bag, then instead of 24/1000 = 2.4% we would compute 24w/(900+100w) = 0.2%.

As a less contrived example, Go’s memory profiler aims to sample approximately one allocation per half-megabyte allocated and then derive statistics about where programs allocate memory. Roughly speaking, to do this the profiler maintains a sampling trigger, initialized to a random number between 0 and one million. Each time a new object is allocated, the profiler decrements the trigger by the size of the object. When an allocation decrements the trigger below zero, the profiler samples that allocation and then resets the trigger to a new random number between 0 and one million.

This byte-based sampling means that to estimate the fraction of bytes allocated in a given function, the profiler can divide the total sampled bytes allocated in that function divided by the total sampled bytes allocated in the entire program. Using the same approach to estimate the fraction of objects allocated in a given function would be inaccurate: it would overcount large objects and undercount small ones, because large objects are more likely to be sampled. In order to recover accurate statistics about allocation counts, the profiler applies a size-based weighting function during the calcuation, just as in the M&M example. (This is the reverse of the situation with the M&Ms: we are randomly sampling individual bytes of allocated memory but now want statistics about their “bags”.)

It is not always possible to undo skewed sampling, and the skew makes margin of error calculation more difficult too. It is almost always better to make sure that the sampling is aligned with the statistic you want to compute.
