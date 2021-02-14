---
layout:     post
title:      Deep Learning for HPC algorthims
date:       2021-02-13
summary:    HPC deep learning
categories: HPC
---
The ring allreduce is a well-known algorithm in the field of high-performance computing, but tends to receive fairly little use within deep learning. In our lab, we’ve managed to use this tool as the basis for all our data-parallel training, allowing us to effectively scale training to dozens of GPUs.

In order to minimize communication overhead, we can exploit the structure of the neural network. In every iteration, every GPU runs forward propagation to compute errors, and then runs backward propagation to compute gradients for each of the parameters of the neural network. Backpropagation computes gradients starting from the output layer and moving towards in the put layer, which means that gradients for the output layer parameters are available significantly before gradients for the earlier layers. Since the allreduce can operate on a subset of the parameters of the network at a time, we can start the allreduce on the output layer parameters while the other gradients are still being computed. Doing so overlays the communication with the rest of the computation in the backpropagation step, and so reduces the total amount of time each GPU ends up waiting for communication to complete.

For example, consider a language model similar to the one in2, but with approximately 300 million learnable parameters (and thus with a total gradient size of 1.2 gigabytes). Using the allreduce, each GPU must send and receive about 2.4 gigabytes of data. Using a CUDA-aware MPI implementation (such as OpenMPI), we can transfer data between GPUs using GPUDirect RDMA with a bandwidth of roughly 10 gigabytes per second; however, the connection between nodes in our cluster is slower, with Infiniband providing a bandwidth of roughly 6 gigabytes per second. Since the limiting factor is the Infiniband connections, a single iteration requires about

2.4 gigabytes6.0 gigabytes per second≈400 milliseconds per iteration

Since layers deeper into the network have gradients available first, we can start doing the data transfers before the entire backpropagation pass is completed, so the true overhead may be less than 400 milliseconds; the overlap between communication and compute may vary depending on the nature of the neural network being optimized.

We implemented the aforementioned language model and tested the time taken per iteration as we scale from a single GPU (with no communication overhead) to 40 GPUs. These 40 GPUs are arranged into 5 nodes with 8 GPUs each, connected by Infiniband. We ran the language model for 300 iterations with a batch size of 32 and computed the number of samples processed per second.
