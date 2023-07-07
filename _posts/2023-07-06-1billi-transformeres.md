The benefit of "traditional" O(N^2) transformer attention is you correlate every token to every other token. So, in the limit, your network won't "miss" much.
When you abandon O(N^2) attention, you are forced to start adding heuristics to choose what to correlate. Any time you see one of those giant context window LLMs, you need to be asking what heuristics they added, what is getting correlated, and what is not getting correlated.

This paper chooses an exponential heuristic where tokens further in the past get exponentially less attention. This heuristic is fine for certain tasks like responding in a chat room, where the most recent tokens are the most important, but bad for tasks where tokens are roughly equally important throughout the text, such as a dense academic paper or a reference manual.

The bitter lesson [1] is going to eventually come for all of these. Eventually we'll figure out how to machine-learn the heuristic rather than hard code it. Recurrent neural networks (RNNs) do this implicitly, but we don't yet know how to effectively train RNNs on ultra-deep sequences.

Another possibility is learning a heuristic for non-recurrent LLMs via reinforcement learning, such as in [2], which is basically a reinforcement learned "auto-researcher" that was trained in a style reminiscent of AlphaGo.

[1] http://www.incompleteideas.net/IncIdeas/BitterLesson.html

[2] https://arxiv.org/pdf/2109.00527.pdf

A parallel view to the BitterLesson is playing out . There are exceptions. Its not only computation but also a mix of:
1. decades of theoretical breakthroughs coming together. 2. there is also collective human creativity and perseverance.

Like Yann Le Cunn, Geoff Hinton etc have been working since the 90's and there were several milestones that were hit and it only caught on fire/went on steroids once the application(and the associated funding) was found due to creativity in the tech sector. But if the computation was somehow available before I am not sure it would have happened so quickly.

Another example is that all methods under the AI umbrella are not dependent on crazy amounts of computation and data. Take the field of AutoRegressive models in Social/Life Sciences field. For example lets look at the STAN which broadly does heirarchical Bayesian Inference using MonteCarlo based methods in social science.

It took some hard theoretical advancements to move the needle on MonteCarlo Simulation methods like detecting convergence and ability to have non conjugated priors for posterior sampling to work etc. The new methods are better by leaps and bounds over the conventional methods in the field. The computation for running the modern models from 2013 would be enough to run em for most cases.

Then again, compute>>>>creativity, if le cunn didn't exist we'd find a worse but also suitable archetircure. 

