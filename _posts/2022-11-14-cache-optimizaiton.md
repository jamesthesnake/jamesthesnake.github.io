# Performance Optimizations Can Have Unexpectedly Large Effects When Combined With Caches
<b>
This post is about a non-obvious interaction between performance optimizations and LRU/time limited caching.


We were able to run the whole process under a sampling profiler, and found that the foo method was taking roughly 50% of the time. Fortunately, it wasn't hard to see room for improvement. The details were tricky, but after some work, I thought I had a solid improvement. 
<br>  
I could avoid at least half of the work in the foo method, so perhaps I could shave 45 minutes off the whole process.

We uploaded code to the test environment, expecting to wait a few hours, but the entire process finished in 45 minutes. 
<br> 
  Instead of a 45 minute savings, we'd shaved off <b>2 hours and 15 minutes</b>. My first instinct was that we had a bug--nothing is faster than throwing an exception, or skipping all the real work.

In fact, the code was fine. What I didn't realize is that the code pulled data from caches that expired as time went on, and a significant portion of the original 3 hours was spent fetching data that had expired from the cache.
  
  <br>After optimizing one slow portion of the code, other portions were reaching from the cache and the overall speedup was larger than seemed possible.

Avoid cold caches!
