cache miss md
Linux recently improved their page fault handling replacing Linked Lists and Red Black trees with a new data structure that offers better cache friendliness. This talk has some pointers to why linked lists fail on modern CPUs and what it takes to make a cache friendly data structure. The Maple Tree FTW .. https://youtu.be/TEHRMzZ01nE?si=9I8dxQtcsE2oY0KU
With a linked list every time u traverse to the next item in the list, u r jumping to a totally random location in the memory. And potentially it's a cache miss. With earlier processors, processor speeds were roughly comparable to that of a memory access. So there was no substantial diff between accessing the next element of an array and that of a linked list. 
But this diff is huge with modern processors using L1, L2 or even L3 caches. So a cache miss is much costlier today. With arrays, elements are placed in contiguous locations and hence cache hit ratio is much more compared to linked lists where elements are placed in random memory locations.