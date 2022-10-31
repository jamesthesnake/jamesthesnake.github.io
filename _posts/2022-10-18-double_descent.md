---
layout: post
title: "Double Descent Graident"
date: 2022-10-18
---
##Deep Double Descent

Open AI shows that the double descent phenomenon occurs in CNNs, ResNets, and transformers: performance first improves, then gets worse, and then improves again with increasing model size, data size, or training time. This effect is often avoided through careful regularization. While this behavior appears to be fairly universal, we don’t yet fully understand why it happens, and view further study of this phenomenon as an important research direction.


READ PAPER
Many classes of modern deep learning models, including CNNs, ResNets, and transformers, exhibit the previously-observed double descent phenomenon when not using early stopping or regularization. The peak occurs predictably at a “critical regime,” where the models are barely able to fit the training set. As we increase the number of parameters in a neural network, the test error initially decreases, increases, and, just as the model is able to fit the train set, undergoes a second descent.

Neither classical statisticians’ conventional wisdom that too large models are worse nor the modern ML paradigm that bigger models are better uphold. We find that double descent also occurs over train epochs. Surprisingly, we show these phenomena can lead to a regime where more data hurts, and training a deep network on a larger train set actually performs worse.

Model-wise double descent
1. There is a regime where bigger models are worse.
fig_modeldd

The model-wise double descent phenomenon can lead to a regime where training on more data hurts. In the chart above, the peak in test error occurs around the interpolation threshold, when the models are just barely large enough to fit the train set.

In all cases we’ve observed, changes which affect the interpolation threshold (such as changing the optimization algorithm, the number of train samples, or the amount of label noise) also affect the location of the test error peak correspondingly. The double descent phenomena is most prominent in settings with added label noise; without it, the peak is smaller and easy to miss. Adding label noise amplifies this general behavior and allows us to easily investigate.

Sample-wise non-monotonicity
2. There is a regime where more samples hurts.
fig_data_hurts

The above chart shows transformers trained on a language-translation task with no added label noise. As expected, increasing the number of samples shifts the curve downwards towards lower test error. However, since more samples require larger models to fit, increasing the number of samples also shifts the interpolation threshold (and peak in test error) to the right.

For intermediate model sizes (red arrows), these two effects combine, and we see that training on 4.5x more samples actually hurts test performance.

Epoch-wise double descent
3. There is a regime where training longer reverses overfitting.
fig_epoch_train

fig_epoch_test

The charts above show test and train error as a function of both model size and number of optimization steps. For a given number of optimization steps (fixed y-coordinate), test and train error exhibit model-size double descent. For a given model size (fixed x-coordinate), as training proceeds, test and train error decreases, increases, and decreases again; we call this phenomenon epoch-wise double descent.

In general, the peak of test error appears systematically when models are just barely able to fit the train set.

Our intuition is that, for models at the interpolation threshold, there is effectively only one model that fits the train data, and forcing it to fit even slightly noisy or misspecified labels will destroy its global structure. That is, there are no “good models” which both interpolate the train set and perform well on the test set. However, in the over-parameterized regime, there are many models that fit the train set and there exist such good models. Moreover, the implicit bias of stochastic gradient descent (SGD) leads it to such good models, for reasons we don’t yet understand.

We leave fully understanding the mechanisms behind double descent in deep neural networks as an important open question.

