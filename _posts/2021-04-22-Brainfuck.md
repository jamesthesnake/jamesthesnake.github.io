---
layout:     post
title:      Brainfuck
date:       2021-04-2
summary:    Brain as a serice
categories: RSA
---


If you want to start learning a programming language - write a BF interpreter in it. For many years this has been a common suggestion to the newcomers into programming. And we all know how the typical solution would look like:
Well, or something a bit more readable in ~100 lines of code.

But, hey, that’s not how things should be done these days! First of all, the common truth is that “C is unsafe” and thus should be avoided at all costs. We are writing an interpreter, a serious and complex software, so Java, Go, Python, at least Rust would be a good start.

Then, every junior programmer knows that computers are unreliable, and such a critical tool as interpreter should not be run on a local machine. Better move it into the cloud from the beginning. Nothing says “I treat my software seriously” better than paying for its CPU usage from your own pocket.

And of course, monoliths are so old-school. Look, BF interpreter has been waiting for years to be semantically split into self-contained microservices. How about we take one to do the parsing, another moves the pointer and the third one increments and decrements memory cells? Sounds logical, and definitely reduces the complexity of the interpreter.

When we do the parsing - we need to take care about the loops. Ideally, we should put loop beginning address onto the stack and pop it when we need to jump back and repeat the loop. However, nobody in their sane mind would be writing such complex data structure as stack manually! Fortunately, quick googling shows that Redis already has lists and stacks implemented, and it’s a software with good reputation and many githib stars, so we’d better delegate handling stacks to it. Some trivial LPUSH/LPOP commands would do all the job and our service remains small and focused.

Moving the pointer is not so simple either. Where do we store the pointer value? I suggest we take a MongoDB and put a pointer as a document there. Yes, for now it’s just a single number, but who knows what else we would need to store in the future? We are lucky here, Mongo even has an $inc function to increment numbers, as if it was created to be used in BF interpreters! Talking to my SRE peers proves that if one has not got any weird problems with Mongo yet - they should definitely give it a try in production!

Finally, operations on memory cells. Whoa, this is hard. Memory is big and should be reliable. How about PostgreSQL? It’s battle tested, we can set up a few replicas. In fact, let’s go one step futher and think about performance. We can’t put all memory cells into one database. That would be slow. How about we put odd addresses in one and even addresses in the other? Such sharding should speed up things a little.


