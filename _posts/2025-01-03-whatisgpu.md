The “brains” of personal computers are central processing units (CPUs). Traditionally, chipmakers made CPUs faster by increasing the frequency of the clock that acts as its heartbeat. But in the early 2000s, overheating forced chipmakers to mostly abandon this technique.

Chipmakers started making CPUs that could execute more than one instruction at a time. But they were held back by a programming paradigm that requires instructions to mostly be executed in order.

A new architecture was needed to take full advantage of Moore’s Law. Enter Nvidia.

In 1999, Nvidia started selling graphics processing units (GPUs) to speed up the rendering of three-dimensional games like Quake III Arena. The job of these PC add-on cards was to rapidly draw thousands of triangles that made up walls, weapons, monsters, and other objects in a game.

This is not a sequential programming task: triangles in different areas of the screen can be drawn in any order. So rather than having a single processor that executed instructions one at a time, Nvidia’s first GPU had a dozen specialized cores—effectively tiny CPUs—that worked in parallel to paint a scene.

Over time, Moore’s Law enabled Nvidia to make GPUs with tens, hundreds, and eventually thousands of computing cores. People started to realize that the massive parallel computing power of GPUs could be used for applications unrelated to video games.

In 2012, three University of Toronto computer scientists—Alex Krizhevsky, Ilya Sutskever, and Geoffrey Hinton—used a pair of Nvidia GTX 580 GPUs to train a neural network for recognizing images. The massive computing power of those GPUs, which had 512 cores each, allowed them to train a network with a then-impressive 60 million parameters. They entered ImageNet, an academic competition to classify images into one of 1,000 categories, and set a new record for accuracy in image recognition.

Before long, researchers were applying similar techniques to a wide variety of domains, including natural language.

