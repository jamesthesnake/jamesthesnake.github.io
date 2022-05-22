---
layout:     post
title:      Parquet PostGress 
date:       2022-05-04
summary:    parquet postgres
categories: parquet postgres
---
The thing about log tables is, they don't change much. They are append-only by design. They are also queried fairly irregularly, and the queries are often time ranged: "tell me what happened then" or "show me the activities between these dates".

So, one way the Retool migration could have been easier is if their log tables were constructed as time-ranged partitions. That way there'd would only be one "live" table in the partition set (the one with the recent entries) and a larger collection of historical tables. The migration could move the live partition as part of the critical path, and do all the historical partitions later.Even after breaking up the log tables into manageable chunks they still remain, in aggregate, pretty big! The PostgreSQL documentation on partitioning has some harsh opinions about stale data living at the end of a partition collection:

    The simplest option for removing old data is to drop the partition that is no longer necessary.

There's something to that! All those old historical records just fluff up your base backups, and maybe you almost never have occasion to query it.

Is there an alternative to dropping the tables?
Dump Your Data in the Lake

What if there was a storage option that was still durable, allowed access via multiple query tools, and could integrate transparently into your operational transactional database?
