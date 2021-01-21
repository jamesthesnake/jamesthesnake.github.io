---
layout:     post
title:      Proof of Log_sum_exp
date:       2020-11-30
summary:    Proof of Log_sum_exp?
categories: Logsum machinelearning proof
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
$$\begin{eqnarray*}({\text{log} \alpha(h_t) =\text{log} p(v_t\vert h_t)\Pi\alpha(h_t-1)\p(h_t|vert h_t -1})\end{eqnarray*}$$


You can insert some formula $$f(x) = \int_{-\infty}^\infty \hat f(\xi)\,e^{2 \pi i \xi x} \,d\xi$$ in the middle of a sentence.

You can also put large formulas in their own paragraph.

$$f(x) = \int_{-\infty}^\infty \hat f(\xi)\,e^{2 \pi i \xi x} \,d\xi$$

That's it!
$$\begin{eqnarray*} \text{logsumexp}(\mathbf{x}) = \text{log} \left( \sum_{i} \text{exp}(x_i - \text{max}(\mathbf{x})) \right) + \text{max}(\mathbf{x}). \end{eqnarray*}$$</center><p>(See <a href="https://www.xarg.org/2016/06/the-log-sum-exp-trick-in-machine-learning/">this post</a> for the proof that the trick works.)</p><p>Now we won’t get an overflow because we’re taking the 
    $\text{exp}$ of $[-2000,-1000,0]$ 
    instead of $[7000,8000,9000]$. If we now run this instead:</p><pre style="font-size:13px">
x = np.array([7000,8000,9000])

[\log\sum\limits_{i=1}^n e^{x_i} = a + \log\sum\limits_{i=1}^n e^{x_i-a}\]
