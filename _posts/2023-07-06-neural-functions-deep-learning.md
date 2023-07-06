As AI increasingly affects our lives, businesses may look to their software engineers for explanations regarding AI model outputs and guidance implementing and integrating these systems. Understanding the foundations of AI may become essential, even for software engineers that do not aspire to becoming AI researchers. In this series of articles, I shall attempt to produce a layperson software engineer’s guide to understanding neural networks, transformers and mechanistic interpretability. Instead of the guide serving as a fully comprehensive reference, I’m aiming for it to be an approachable yet detailed deep-dive into necessary intuitions for understanding and complementary to existing educational materials (which I will link to where I can).

A fundamental technique in AI is the application of neural networks, which are proven by the “universal approximation theorem” to be “universal function approximators”. They can reproduce the behavior of any continuous function within a specified domain, provided they have the appropriate structure and size. In practice, neural networks can also reproduce functions with discontinuities and capture trends in non-deterministic processes by smoothing over issues and learning expected behaviors.

Interpretability

As software engineers, we construct functions by arranging syntax to express our logical intent — e.g. if n <= 1 { n } else { fn(n-1) + fn(n-2) }. This naturally leads to functions that are easy for humans to understand and interpret, because (1) they are written in a way that is similar to how we would explain the function to others, (2) we have a full range of high-level programming syntaxes and library calls available to us instead of only a limited set of mathematical operations, and finally (3) related logic is generally refactored so as to be colocated, SOLID, etc.

Unfortunately, the functions modeled by neural networks are not inherently human-interpretable due to the way they are constructed. A neural network is essentially an incomprehensibly large mathematical expression composed of stacked layers. Each layer forwards its outputs to another layer, and is made up from mathematical expressions representing artificial neurons computing the weighted sum of inputs plus a bias (an affine transformation but sometimes referred to as a “linear map”) followed by a non-linear activation function (e.g. activation(sum(weights * inputs) + bias)). There is nothing other than the overall mathematical expression formulated by the neural network, the numeric weights and biases used alongside it that are known to produce accurate results, and the scaffolding used to “train” the expression to perform as expected. This does not lead to natural interpretability and represents a significant issue for businesses reliant on being able to provide authentic explanations to clients on outputs or decisions that are called into question.

Backpropagation is just the chain rule, what’s the problem?

The reason modern neural networks are constructed as giant mathematical expressions, isn’t merely due to computational efficiency, but is substantially because training them requires a process called “backpropagation” (also known as reverse-mode automatic differentiation).

Backpropagation is, in essence, just the chain rule on (multivariate) functions, and the chain rule is just a way to calculate the derivative (read “rate of change”) of a composite function by multiplying the derivatives of the functions within the composition.

If you haven’t used calculus much since school and have forgotten this, an intuitive understanding of the chain rule is that it allows us to understand the relationships between different rates of change that can be observed in nature.

“If a car travels twice as fast as a bicycle and the bicycle is four times as fast as a walking man, then the car travels  2 ∗ 4 = 8
2∗4=8 times as fast as the man.”

— George F. Simmons

As an example, suppose we have a balloon being inflated such that its volume and radius are changing over time. We can use the chain rule to find out how fast the volume is changing by multiplying the rate of radius change with the rate of radius change per unit volume.

There are two ways this can be expressed. The first highlights the derivative as a composition of functions (Lagrange’s notation), while the latter is the more common form and uses the symbol 
∂
∂ to denote “partial derivative” (Leibniz’s notation).
