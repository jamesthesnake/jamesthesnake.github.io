## The directed graph of a nonnegative matrix
If you looked at the example above, you probably figured out the rule.

Each row is a node, and each element represents a directed and weighted edge. Edges of zero elements are omitted. The element in the i-th row and j-th column corresponds to an edge going from i to j.

The resulting graph is called the directed graph (or digraph) of the matrix.

To unwrap the definition a bit, let's check the first row, which corresponds to the edges outgoing from the first node.

## Benefits of the graph representation
Why is the directed graph representation beneficial for us?

For one, the powers of the matrix correspond to walks in the graph.

Take a look at the elements of the square matrix. All possible 2-step walks are accounted for in the sum defining the elements of A².

If the directed graph represents the states of a Markov chain, the square of its transition probability matrix essentially shows the probability of the chain having some state after two steps.

There is much more to this connection.

For instance, it gives us a deep insight into the structure of nonnegative matrices.

To see what graphs show about matrices, let's talk about the concept of strongly connected components.

## The connectivity of graphs
A directed graph is strongly connected if every node can be reached from every other node.

If this is not true, the graph is not strongly connected.

Below, you can see an example of both.
Matrices that correspond to strongly connected graphs are called irreducible. All other nonnegative matrices are called reducible. Soon, we'll see why.

(For simplicity, I assumed each edge to have a unit weight, but each weight can be an arbitrary nonnegative number.)

Back to the general case!
Let's label the nodes of this graph and construct the corresponding matrix!

(For simplicity, assume that all edges have unit weight.) Do you notice a pattern?

The corresponding matrix of our graph can be reduced to a simpler form!


Even though not all directed graphs are strongly connected, we can partition the nodes into strongly connected components.

Its diagonal comprises blocks whose graphs are strongly connected. (That is, the blocks are irreducible.) Furthermore, the block below the diagonal is zero.

Is this true for all nonnegative matrices?

You bet. Enter the Frobenius normal form.

## The Frobenius normal form
In general, this block-matrix structure that we have just seen is called the Frobenius normal form.

If you have a sharp eye with a hint of OCD, you probably noticed that I switched up the colors a bit. From now on, irreducible blocks (a.k.a. matrices that correspond to strongly connected graphs) will be colored maize, while reducible ones will be light blue.

Let's reverse the question: can we transform an arbitrary nonnegative matrix into the Frobenius normal form?

Yes, and with the help of directed graphs, this is much easier to show than purely using algebra.

Here is the famous theorem in full form.



