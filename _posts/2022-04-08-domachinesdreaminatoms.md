---
layout:     post
title:      Do machines dream in atoms
date:       2022-04-08
summary:    Proof of Log_sum_exp?
categories: Machines dream atoms ml
---
“Do machines dream of atoms?”  TLDR; basically if you train a RF model that predicts a value of the function that is a sum of atomic-type contributions (cLogP), the resulting model (models is using fps as an input) can learn that the importance of the bits in the fp that correspond to specific atoms/fragments closely follow the atomic-types contributions in the function that they attempted to learn 

Do machines dream of atoms? A quantitative molecular benchmark for explainable AI heatmaps
Maria H. Rasmussen1,2, Diana S. Christensen1, and Jan H. Jensen1,2 1Department of Chemistry, University of Copenhagen, Denmark
2E-mail: mhr@chem.ku.dk, jhjensen@chem.ku.dk, Twitter: @janhjensen March 14, 2022
Abstract
While there is a great deal of interest in methods aimed at explaining machine learning predictions of chemical properties, it is difficult to quantitatively benchmark such methods, especially for regression tasks. We show that the Crippen logP model (J. Chem. Inf. Comput. Sci. 1999, 39, 868) provides an excellent benchmark for atomic attribution/heatmap approaches, especially if the ground truth heatmaps can be adjusted to reflect the molecular representation. The ”atom attribution from finger prints”-method developed by Riniker and Landrum (J. Chem. Inf. Comput. Sci. 2013, 5, 43) gives atomic attribution heatmaps that are in reasonable agreement with the atomic contribution heatmaps of the Crippen logP model for most molecules, with average heatmap overlaps of up to 0.54. The agreement is increased significantly (to 0.75) when the atomic contributions are adjusted to match the fact that the molecular representation is fragment-based rather than atom-based (the finger print-adapted (FPA) ground truth vector). Most heatmaps and the corresponding FPA overlaps are relatively insensitive to the training set size and the results are close to converged for a training set size of 1000 molecules, although for molecules with low overlap some heatmaps change significantly. Heatmaps of the prediction uncertainty and the uncertainty in the atomic attributions can help identify molecular regions that contribute significantly to errors in the logP prediction and/or attribution and these heatmaps can be used to guide the design of counterfactual examples to probe the ML model further. Like the simpler attribution benchmarks for classification tasks that have come before it, this work sets the bar for regression tasks.
