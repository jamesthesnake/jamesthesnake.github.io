---
layout:     post
title:      Proof of Log_sum_exp
date:       2020-11-30
summary:    Proof of Log_sum_exp?
categories: machine-learning neural-networks drawing recurrent-neural-network
---


Proof goes here!
Latext to come
$$\Gamma(z) = \int_0^\infty t^{z-1}e^{-t}dt\,.$$
% \f is defined as #1f(#2) using the macro
\f\relax{x} = \int_{-\infty}^\infty
    \f\hat\xi\,e^{2 \pi i \xi x}
    \,d\xi
    
$$\begin{eqnarray*} \text{logsumexp}(\mathbf{y}) = \text{log} \left( \sum_{i=1} \text{exp}(x_i - \text{max}(\mathbf{x})) \right) . \end{eqnarray*}$$
      
You can insert some formula $$f(x) = \int_{-\infty}^\infty \hat f(\xi)\,e^{2 \pi i \xi x} \,d\xi$$ in the middle of a sentence.

You can also put large formulas in their own paragraph.

$$f(x) = \int_{-\infty}^\infty \hat f(\xi)\,e^{2 \pi i \xi x} \,d\xi$$

That's it!
$$\begin{eqnarray*} \text{logsumexp}(\mathbf{x}) = \text{log} \left( \sum_{i} \text{exp}(x_i - \text{max}(\mathbf{x})) \right) + \text{max}(\mathbf{x}). \end{eqnarray*}$$</center><p>(See <a href="https://www.xarg.org/2016/06/the-log-sum-exp-trick-in-machine-learning/">this post</a> for the proof that the trick works.)</p><p>Now we won’t get an overflow because we’re taking the 
    $\text{exp}$ of $[-2000,-1000,0]$ 
    instead of $[7000,8000,9000]$. If we now run this instead:</p><pre style="font-size:13px">
x = np.array([7000,8000,9000])

[\log\sum\limits_{i=1}^n e^{x_i} = a + \log\sum\limits_{i=1}^n e^{x_i-a}\]
