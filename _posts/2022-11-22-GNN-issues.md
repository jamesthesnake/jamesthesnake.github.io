---
layout:     post
title:      GNN issues
date:       2022-11-22
summary:    GNN
categories: GNN ML AI Drug discovery 
---
We want to be able to capture structural differences in graphs using GNN. Consider the below two graphs below, they can be the whole graphs or even part of a subgraph. It becomes even more important in case of a classification scenario.structure

Essentially this is called the graph isomorphism test problem. No polynomial algorithms exist for general case. GNN's might not perfectly distinguish any graphs, but we want to understand how well can GNNs can do graph isomorphism test. We need to rethink the mechanism of how GNNs we studied till now capture graph structure.

If two graphs with different structures have different computational graphs for each node with different topologies, we want to be able to take advantage of this. Below is the computational graphs for the small graphs with 4 nodes each with different structures. We showed a 2-hop computational graph, which is generally what we do in practice while training.computational graph

Considering nodes with uniform features, most discriminative GNNs that discriminate the above two graphs will map different subtrees of computational graphs into different node representations. We call this property Injectivity. We call a function injective if it maps different elements into different outputs. If a function maps any two different inputs to the same output, that function is not injective.

We want to make sure that our aggregation mechanism through the computational graph is injective to get different outputs for different computation graphs. And the entire neighbourhood aggregation is injective if every step of neighbour aggregation is injective.

Until now we thought of neighbourhood aggregation as traversing a graph, now we want to see it as a function and if it is injective or not. Neighbour aggregation is essentially a function over a multi-set, where elements repeat. Examples of multi-sets are [a,a],[b,b],[a,a,b][a, a], [b, b], [a, a, b][a,a],[b,b],[a,a,b] where a and b are elements of a set. Now we can see that the discriminative power of GNNs can be characterized by that of multi-set functions.

