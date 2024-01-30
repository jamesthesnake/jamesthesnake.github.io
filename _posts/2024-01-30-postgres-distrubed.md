Distributed PostgreSQL architectures are ultimately trying to address the operational hazards of a single machine in different ways. In doing so, they do lose some of its efficiency, and especially the low latency.

Goals of a Distributed Database Architecture
The goal of a distributed database architecture is to try to meet the availability, durability, performance, regulatory, and scale requirements of large organizations, subject the physics. The ultimate goal is to do so with the same rich functionality and precise transactional semantics as a single node RDBMS.

There are several mechanisms that distributed database systems employ to achieve this, namely:

Replication - Place copies of data on different machines
Distribution - Place partitions of data on different machines
Decentralization - Place different DBMS activities on different machines
In practice, each of these mechanisms inherently comes with concessions in terms of performance, transactional semantics, functionality, and/or operational complexity.

To get a nice thing, you’ll have to give up a nice thing, but there are many different combinations of what you can get and what you need to give up.

The importance of latency in OLTP systems
Of course, distributed systems have already taken over the world, and most of the time we don’t really need to worry a lot about trade-offs when using them. Why would distributed database systems be any different?

The difference lies in a combination of storing the authoritative state for the application, the rich functionality that an RDBMS like PostgreSQL offers, and the relatively high impact of latency on client-perceived performance in OLTP systems.

PostgreSQL, like most other RDBMSs, uses a synchronous, interactive protocol where transactions are performed step-by-step. The client waits for the database to answer before sending the next command, and the next command might depend on the answer to the previous.

Any network latency between client and database server will already be a noticeable factor in the overall duration of a transaction. When PostgreSQL itself is a distributed system that makes internal network round trips (e.g. while waiting for WAL commit), the duration can get many times higher.

Why is it bad for transactions to take longer? Surely humans won’t notice if they need to wait 10-20ms? Well, if transactions take on average 20ms, then a single (interactive) session can only do 50 transactions per second. You then need a lot of concurrent sessions to actually achieve high throughput.

Having many sessions is not always practical from the application point-of-view, and each session uses significant resources like memory on the database server. Most PostgreSQL set ups limit the maximum number of sessions in the hundreds or low thousands, which puts a hard limit on achievable transaction throughput when network latency is involved. In addition, any operation that is holding locks while waiting for network round trips is also going to affect the achievable concurrency.

