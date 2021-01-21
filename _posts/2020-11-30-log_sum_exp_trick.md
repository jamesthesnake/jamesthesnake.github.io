---
layout:     post
title:      Proof of Log_sum_exp
date:       2020-11-30
summary:    Proof of Log_sum_exp?
categories: logsum machinelearning proof
---



$$\begin{eqnarray*} (\mathbf{y}) = \text{log} \left( \sum_{i=1}^n e^{(x_i)} \right) . \end{eqnarray*}$$

For example in filtering problems for which the posterior is calculated recursively:


      
$$\begin{eqnarray*}({p(h_t\vert v_{1:t})} \equiv \alpha(h_t) = p(v_t\vert h_t)\prod_{h_t}\alpha(h_{t-1})p(h_t\vert h_{t-1})\end{eqnarray*}$$
<br>
As \alphaα can be quite small, it's a common method to solve the problem in log-space:



<br>
$$\begin{eqnarray*}({\text{log} \alpha(h_t) =\text{log} p(v_t\vert h_t)+\text{log} \left( \sum_{i=1}^n \text{exp} (\text{log}(\alpha(h_t-1))+\text{log}p(h_t\vert h_{t-1}) \right)})\end{eqnarray*}$$

<br>
Another example is a multinomial distribution which you want to parameterize with softmax, like e.g. logistic regression with more than 2 unordered categories. If you now want to calculate the log-likelihood you get the quantity due to the normalization constant.

Both problems have in common, that if you try to calculate it naively, you quite quickly will encounter underflows or overflows, depending on the scale of $$\begin{eqnarray*}({x_(ix)})\end{eqnarray*}$$

​	
 . Even if you work in log-space, the limited precision of computers is not enough and the result will be INF or -INF. So what can we do?

We can show, that the following equation holds:

$$\begin{eqnarray*}(\text{log}\left(\sum_{i=1}^n e^{(x_i)} \right) = \alpha + \text{log} \left(\sum_{i=1}^n e^{(x_i)-\alpha} \right))\end{eqnarray*}$$


For an arbitrary $$\begin{eqnarray*}\alpha\end{eqnarray*}$$. This means, you can shift the center of the exponential sum. A typical value is setting aa to the maximum, which forces the greatest value to be zero and even if the other values would underflow, you get a reasonable result:

$$\begin{eqnarray*}(\alpha=\text(max)x_i\end{eqnarray*}$$


PROOF
$$\begin{eqnarray*}
y= \text{log}\left(\sum_{i=1}^n e^x_i\right)\newline
\Leftrightarrow e^{y}=\left(\sum_{i=1}^n e^{(x_i)} \right)\newline
\Leftrightarrow e^{y-a}=left(\sum_{i=1}^n e^{(x_i)*e^{-a}} \right)\newline\end{eqnarray*}$$
