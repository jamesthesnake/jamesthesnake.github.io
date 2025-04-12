## Two-Way Fixed Effects and the Great Causal Bait-and-Switch
I was recently in a debate about two-way fixed effects and walked away with the same uneasy feeling I get every time this topic comes up: that TWFE often pretends to solve causal inference problems while quietly redefining the question. Not with any malicious intent, of course—but with a kind of methodological sleight of hand that lets us get a publishable result without answering what we actually set out to ask.

Let’s start with what TWFE is supposed to do. You’ve got panel data—say counties over time—and you want to estimate the effect of a treatment or policy. The pitch is that if you throw unit and time fixed effects into a regression, you’ll control for all time-invariant differences across units and all shocks common across time. That sounds great. Suddenly your observational data starts to look like a pseudo-experiment. You control for unobservables, account for confounders, and, best of all, get a single coefficient that you can interpret as a causal effect. What's not to love?

But here’s the thing: in doing all that, you also transform the outcome. Your real question might’ve been something like “Did expanding Medicaid reduce mortality?” But by the time you run the TWFE regression, what you’re actually estimating is something more like “Did counties that expanded Medicaid experience changes in the residual part of mortality after controlling for time and unit effects?” That may seem like a technicality, but it’s a major conceptual shift. The question changed. The DV changed. The causal story now runs through a lens that strips out a bunch of the variation that actually matters.

This kind of bait-and-switch is subtle. Sometimes it happens by accident. You start out caring about some policy impact, but once TWFE doesn’t give you the result you hoped for, you tweak the outcome. Try a log transform. Try a rate instead of a count. Maybe switch from mortality to insurance coverage. And if one of those versions gives you a statistically significant effect with fixed effects baked in, that becomes the story—even if it’s not what you cared about originally. The data analysis becomes the map, not the territory.

And this is all before we even get to the known failure modes of TWFE. The estimator is notoriously fragile when you have staggered treatment timing and heterogeneous treatment effects. In that setting, TWFE doesn’t estimate a clean average treatment effect—it estimates a weird weighted average that can include negative weights. If early adopters of a policy respond differently than late adopters (and they always do), TWFE blends them in a way that gives you something you can't interpret. Worse, it often ends up comparing treated units to other treated units, just at different time points. That’s not a counterfactual. That’s a methodological shrug.

And yet, TWFE remains the default in tons of applied work. Why? Because it’s easy, it’s baked into every stats package, and it gives you a single, clean coefficient. It’s neat. It fits in a regression table. It feels like science.

But we can do better. If you're dealing with staggered adoption or dynamic treatment effects, use estimators that are designed for it. The Callaway & Sant’Anna or de Chaisemartin & D’Haultfœuille approaches are solid. Sun & Abraham’s method directly corrects for the weighting problems in TWFE. If you care about heterogeneity, try causal forests or other ML-driven DiD setups. And above all, be honest about what your model is estimating and whether that lines up with your actual research question.

If you’re going to use TWFE, just make sure you're not doing causal inference by convenience. Ask yourself:

Is this model really answering the question I care about?

Am I interpreting a transformed outcome as if it were the original?

Would I still publish this if the coefficient had gone the other way?

Because otherwise, you might just be telling a story with a fancy footnote.

