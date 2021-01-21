---
layout:     post
title:      Proof of Log_sum_exp
date:       2020-11-30
summary:    Proof of Log_sum_exp?
categories: logsum machinelearning proof
---


Proof goes here!
Latext to come
$$\Gamma(z) = \int_0^\infty t^{z-1}e^{-t}dt\,.$$
% \f is defined as #1f(#2) using the macro
\f\relax{x} = \int_{-\infty}^\infty
    \f\hat\xi\,e^{2 \pi i \xi x}
    \,d\xi
    
$$\begin{eqnarray*} (\mathbf{y}) = \text{log} \left( \sum_{i=1}^n e^{(x_i)} \right) . \end{eqnarray*}$$

For example in filtering problems for which the posterior is calculated recursively:


      
$$\begin{eqnarray*}({p(h_t\vert v_{1:t})} \equiv \alpha(h_t) = p(v_t\vert h_t)\prod_{h_t}\alpha(h_{t-1})p(h_t\vert h_{t-1})\end{eqnarray*}$$


<br>
$$\begin{eqnarray*}({\text{log} \alpha(h_t) =\text{log} p(v_t\vert h_t)+\text{log} \left( \sum_{i=1}^n \text{exp} (\text{log}(\alpha(h_t-1))+\text{log}p(h_t\vert h_{t-1}) \right)})\end{eqnarray*}$$

<br>
Another example is a multinomial distribution which you want to parameterize with softmax, like e.g. logistic regression with more than 2 unordered categories. If you now want to calculate the log-likelihood you get the quantity due to the normalization constant.

Both problems have in common, that if you try to calculate it naively, you quite quickly will encounter underflows or overflows, depending on the scale of $$\begin{eqnarray*}({x_ix})\end{eqnarray*}$$

​	
 . Even if you work in log-space, the limited precision of computers is not enough and the result will be INF or -INF. So what can we do?

We can show, that the following equation holds:


<br>
You can insert some formula $$f(x) = \int_{-\infty}^\infty \hat f(\xi)\,e^{2 \pi i \xi x} \,d\xi$$ in the middle of a sentence.

You can also put large formulas in their own paragraph.

$$f(x) = \int_{-\infty}^\infty \hat f(\xi)\,e^{2 \pi i \xi x} \,d\xi$$

That's it!
$$\begin{eqnarray*} \text{logsumexp}(\mathbf{x}) = \text{log} \left( \sum_{i} \text{exp}(x_i - \text{max}(\mathbf{x})) \right) + \text{max}(\mathbf{x}). \end{eqnarray*}$$</center><p>(See <a href="https://www.xarg.org/2016/06/the-log-sum-exp-trick-in-machine-learning/">this post</a> for the proof that the trick works.)</p><p>Now we won’t get an overflow because we’re taking the 
    $\text{exp}$ of $[-2000,-1000,0]$ 
    instead of $[7000,8000,9000]$. If we now run this instead:</p><pre style="font-size:13px">
x = np.array([7000,8000,9000])

[\log\sum\limits_{i=1}^n e^{x_i} = a + \log\sum\limits_{i=1}^n e^{x_i-a}\]
