---
layout:     post
title:      Feature Flags
date:       2020-12-07
summary:    Feature Flags
categories: Feature Flags Infrastructure 
---

# Feature flags are how infrastructure is rolled out. “Feature flags” are a common way product engineers roll out new features in a system. Feature flags are typically associated with frontend A/B testing where they are used to show a new design or feature to only some of the userbase. But they are a powerful way of replacing infrastructure as well.

Too many projects have failed because they went for the “big cutover” or a series of “big cutovers” that were then forced into rollbacks by bugs found too late. By using feature flags instead, you’ll gain confidence in your project and mitigate the costs of failure.

Suppose you’re going from a single database to a service that hides the details of a new storage solution. Using a feature flag, you can slowly ramp up writes to the new service in parallel to the writes to the old database to make sure its write path is correct and fast enough. After the write path is at 100% and backfilling into the service’s datastore is complete, you can use a separate feature flag to start reading from the service, without using the data in user responses, to check for performance problems. Another feature flag can be used to perform comparison checks on read of the data from the old system and the new one. And one final flag can be used to slowly ramp up the “real” reads from the new system.

By breaking up the deployment into multiple steps and affording yourself quick and partial reactions with feature flags, you make it easier to find bugs and performance problems as they occur during ramp up instead of at a “big bang” release time. If an issue occurs, you can just tamp the feature flag setting back down to a lower (perhaps, zero) setting immediately. Adjusting the rates lets you debug and experiment at different amounts of traffic knowing that any problem you hit isn’t a total disaster. With feature flags, you can also choose other migration strategies, like moving requests over on a per-user basis, that provide better insight into the new system. And when your new service is still being prototyped, you can use flags at a low setting to have your new system consume fewer resources.

Now, feature flags sound like a terrible mess of conditionals to a classically trained developer or a new engineer with well-intentioned training. And the use of feature flags means accepting that having multiple versions of infrastructure and data is a norm, not an rarity. This is a deep lesson. What works well for single-machine systems sometimes falters in the face of distributed problems.

Feature flags are best understood as a trade-off, trading local complexity (in the code, in one system) for global simplicity and resilience. #

