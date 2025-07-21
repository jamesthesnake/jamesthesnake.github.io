Trying to understand how GPUs work, but confused by all the jargons? This article explains:

What are GPUs optimised for
Key concepts to understand how a single GPU works
How do GPUs within a single node connect with each other
How are GPU nodes connected
Credits to Stanford CS 336 lectures, and I wrote this article with the assistance of Google Gemini to help me fill in the knowledge gaps whenever I lack the pre-requisite knowledge to fully understand the lecture materials.


Optimization goal of GPUs
GPUs are optimised for parallel processing and high-throughput computing, making them highly efficient at handling a massive amount of data simultaneously. This contrasts with CPUs, which are primarily optimized for sequential processing and handling a wide variety of tasks with lower latency.

In the context of machine learning, we mainly use GPUs for matrix multiplications. The goal is for matrix multiplications to be compute-bound, and this is achieved with high FLOPs/bytes (see roofline model below). When the GPUs are compute bound, this means the CUDA cores are utilized to their maximum, i.e. getting the most performance out of the GPUs.

The "roofline" represents the maximum achievable performance for a given hardware platform. The slanted "roof" indicates the program is memory-bound, i.e processing is limited by how fast data can be moved from memory to processor. A flat "ceiling" represents the peak theoretical performance of the processor's Arithmetic Logic Units, or CUDA cores in the context of Nvidia GPUs. This indicates the program is limited by the raw computational power of the processor.

roofline model

Source: Nvidia Nsight

Operational intensity: defined as the ratio of total number of floating-point operations (FLOPs) performed to the number of bytes of data moved from the memory. A higher operational intensity means the algorithm performs many calculations for each piece of data it fetches, usually happens with dense matrix multiplications. Conversely, for sparse matrices with many zero elements, computations involving these zeroes are often skipped, resulting in fewer calculations per unit of data read from memory.
Throughput: measures the performance of the hardware when running a specific program.

Key concepts of GPUs - software and hardware
Term	Nature	Controlled By	Description	Key Relationship	Analogy
Grid	Software (Logical)	Programmer	A collection of all blocks for a single kernel launch. Represents the entire problem space.	A grid is executed by all available SMs on the GPU.	The entire workforce for a massive project.
Streaming Multiprocessor (SM)	Hardware (Physical)	Hardware	A physical processing unit on the GPU chip. It contains CUDA cores, shared memory, schedulers, and registers.	An SM executes one or more blocks concurrently.	A factory floor or a workshop.
Block	Software (Logical)	Programmer	A group of threads (up to 1024) designed to cooperate.	A block is always executed by a single SM. It is never split.	A team of workers assigned to a specific task on one factory floor.
Warp	Hardware & Software Interaction	Hardware	A group of 32 threads that are scheduled and executed in lockstep (SIMT). The fundamental unit of scheduling.	An SM breaks a block down into warps and schedules them for execution.	A small group of 32 workers given the same instruction by a foreman.
Thread	Software (Logical)	Programmer	The most basic unit of execution. A single instance of the kernel function operating on its own private data.	A thread is part of a warp, which is executed by a CUDA core.	An individual worker.
CUDA Core	Hardware (Physical)	Hardware	The fundamental arithmetic logic unit (ALU) on the GPU. It performs the actual math (add, multiply, etc.).	A CUDA core executes instructions from one thread at any given clock cycle. It rapidly switches between many threads over time.	A single tool or machine on the factory floor used by a worker.
Note: SIMT means single instruction, multiple threads. It is an execution model used in parallel computing where single instruction, multiple data (SIMD) is combined with zero-overhead multithreading, i.e. multithreading where the hardware is capable of switching between threads on a cycle-by-cycle basis.
