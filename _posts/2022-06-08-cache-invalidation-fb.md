https://engineering.fb.com/2022/06/08/core-data/cache-invalidation/
My problem has never been invalidation as stated in the article, but how to manage interdependent cache entries, so that when one is invalidated, the dependent ones must also be invalidated. For example get_user(123) and get_users_for_org(456). Suppose user with id 123 is part of the org with id 456. When the user is deleted, you have to invalidate the get_users_for_org(456) entry. I haven’t seen any convincing “design pattern” for managing such dependencies.

I see a couple of monitoring/reporting systems.. but no caching solution. These are tools to catch bugs in the solution you're using. Good work, but not a solution for cache invalidation.
And regarding those tools:

it doesnt sound like Polaris would handle a network partition well. If a cache invalidation triggers it to check the other caches for consistency... that assumes Polaris will receive that invalidation message. Imagine a scenario of 5 cache servers, and a Polaris server. On one side of the split is Polaris and 2 servers, and the other has 3 cache servers... It's possible for the 3 cache servers to receive an update that is not received by the polaris+2 network... And polaris would not just be unaware of the inconsistency, but it also wouldn't know to check later for the inconsistency when the network partition is resolved.

I also feel like the consistency tracing is assuming that only one fill and invalidate is occurring at a time (when in practice, there may be multiple fills and invalidates occurring in parallel on the same data)... and that those calls will arrive in order. If they arrive out of order, it doesnt sound like it would catch that.. and I think you're relying on Polaris to catch this case, but high latency cannot be differentiated from a network partition except the length of the delay... so these two types of errors can be seen together.. in which case, you'd have a cache error that neither tool would detect.

I would like to hear why Im wrong.

I understand this is being used in prod, but network partitions don't occur everyday... and Im not convinced this has seen enough flaky networks to work out the bugs.

