A few years ago, I worked on a project to investigate the potential of machine learning to transform healthcare through modeling electronic medical records. I walked away deeply disillusioned with the whole field and I really don’t think that the field needs machine learning right now. What it does need is plenty of IT support. But even that’s not enough. Here are some of the structural reasons why I don’t think deep learning models on EMRs are going to be useful any time soon.
1. Data is fragmented

There are many players in the field - Epic, Cerner, Meditech, AllScripts, AthenaHealth, to name a few. It isn’t necessarily bad to have many players, but these players don’t cooperate in data interoperability, as they see the difficulty of data migration as a competitive moat.

Each player also tends to specialize in a certain kind of clinic - big research hospital, small regional hospital, outpatient clinic, urgent care center, radiology center, etc.. So any given patient will have their medical records spread out across several EMR vendors - and if you’re trying to do machine learning with only one vendor or hospital’s data, you’re going to see a very nonrandom subset of patient data. The key data your model needs to make a decision may be entirely absent. Alternatively, it may be present but only in a misleadingly partial way.

Over the last few years, this problem is fixing itself through increased market consolidation. Still, this problem can only be completely solved through data interoperability standards and mandates, which will take a decade to happen and another decade to implement. With incomplete data, deep learning will place great importance on the scraps of information it manages to find, and then spit out an overconfident answer when a patient shows up with an unexpectedly complete record.
2. Data is Workflow, Workflow is Data. (with apologies to Lisp)

EMR software is widely hated by the nurses and doctors who have to use it. It’s slow, bloated, nonintuitive, requires workarounds, etc. etc. etc.. The root of this evil is that every hospital brings its own conceited and byzantine patchwork of procedures, checks, and rituals to the table. The EMR vendor, to secure the deal, promises that they can implement these workflows, resulting in a mess of bloated, redundant, and half-thought out features.

Life would be simpler if only these hospitals could set aside their arrogance and just go with the recommended workflow! Unfortunately, each layer of process is written in the blood of patients that have died due to medical error. The advice against rewriting software systems is fully applicable to rewriting hospital workflows.

In Caruana et al 2015, a story is told about one hospital whose patients with pneumonia and asthma have better survival rates than patients with just pneumonia. This happens because asthma is a known risk factor and these patients are sent directly to the ICU. This sort of workflow difference generates a very clear paperwork signature in EMR software and you can be sure that your deep learning algorithm will find it. Deep learning cannot help but overfit here, and careful inspection is needed in each deployment to guard against counterintuitive and incorrect recommendations.
3. Data reflects an adversarial process

You may not realize that EMRs owe their existence to

    billing
    government mandates
    billing
    helping doctors keep track of their patients’ records

Did you know that a medical coder is a profession? They are employed by the thousands by hospitals for the purpose of ensuring the hospital gets paid by the insurance company. This means keeping the paperwork straight, but it also means the creative and adversarial interpretation of the doctor’s notes to maximize revenue. You get paid a certain amount for treating heart failure. But oh boy do you get paid more if there are complications of the kidney involved. The set of codes that are utilized in any given year shifts like a war zone in the battle between hospitals and insurance companies.

This has two implications. One is that you are fooling yourself if you think that your deep learning model will bend the curve of healthcare costs. Consider what would happen if the hospital were to simply… flip the cost minimizer’s objective function. Would the hospital administrators really do that? (Yes.) Now that I think about it, I wouldn’t be surprised if a cost maximizer existed somewhere in the U.S….

The other implication is that models must be regularly updated to keep up with these changes. Even in software companies, the rollout of a newly retrained model is accompanied with careful validation and monitoring. In the liability-laden hospital setting, the simpler the model, the easier it will be to sign off on its deployment. The Apgar score was introduced many decades ago, and it persists because of its simplicity and universality. I don’t see deep learning overcoming these obstacles anytime soon.
4. Data encodes clinical expertise

Did you know that a blood oxygen saturation of 0% is highly correlated with healthy outcomes? No, I didn’t get the percentage backwards. A 0% reading is what you get when the nurse looks at you and decides you’re too obviously healthy to bother with putting the pulse oximeter on your finger. The empty field value gets saved as a 0, of course.

On the other end of a spectrum, it turns out that the services of the hospital chaplain are highly correlated with death, as their services are often requested when the doctor knows that the patient is on their way out.

It’s hard to imagine how you might disentangle the performance of your deep learning algorithm: is it merely playing a game of Simon Says, or has it actually learned medicine? The difference will quickly become clear, if you’re ever brave enough to deploy one of these models in a clinical setting…
5. Causal inference is hard

Did you know that pap smears are anticorrelated with heart failure? I only discovered this when I dug into the top 100 most important weights in my logistic regression model, and found that pap smears were one of the consistently strongest negative signals. I struggled for two straight days to understand why this was happening - was my data processing pipeline broken? Had I discovered some new medical phenomenon? Are people who regularly get pap smears wealthier or healthier on average?

The answer turns out to be rather mundane. Pap smears are not recommended for women older than 65, and heart failure onset is typically around age 65. The pap smear just turns out to be a really good age bucketing signal to the model.

This spurious correlation was already hard enough to figure out. I don’t have much faith in our ability to understand spurious correlations that are more sophisticated than this example, but I do have much faith in deep learning’s ability to discover them!
Does deep learning have any place in medicine?

There are many ways in which the deployment of deep learning models on EMRs is doomed to fail. Still, EMRs aren’t the entirety of medicine.

Deep learning has the potential to scale up data analysis, specifically in scenarios where the input is a known quantity. The Apple Watch’s heart rate monitor/AFib detector is a great example of this: one company controls both the hardware and software, and the signal is directly taken from the sensors. Other places where we have lots of raw high-dimensional data are ripe for innovation.

Another application is original medical research. If you are one of those rare folks with both a strong clinical and statistical expertise, you will find many fresh medical hypotheses buried in the data. Most of these will be statistical noise and false positives, like my story about pap smears and heart failure. Clinical expertise is absolutely necessary to ask the right questions, to set up the inputs to the model, and to sift through the findings. Following that, clinical research will be necessary to validate the discovery.
