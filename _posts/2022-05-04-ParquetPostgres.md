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
What if there was a storage option that was still durable, allowed access via multiple query tools, and could integrate transparently into your operational transactional database?

How about: storing the static data in Parquet format but retaining database access to the data via the parquet_fdw?

Sounds a bit crazy, but:

    A foreign parquet table can participate in a partition along with a native PostgreSQL table.
    A parquet file can also be consumed by R, Python, Go and a host of cloud applications.
    Modern PostgreSQL (14+) can parallelize access to foreign tables, so even collections of Parquet files can be scanned effectively.
    Parquet stores data compressed, so you can get way more raw data into less storage.

Wait, Parquet?

Parquet is a language-independent storage format, designed for online analytics, so:

    Column oriented
    Typed
    Binary
    Compressed

A standard table in PostgreSQL will be row-oriented on disk.

This layout is good for things PostgreSQL is expected to do, like query, insert, update and delete data a "few" records at a time. (The value of "a few" can run into the hundreds of thousands or millions, depending on the operation.)

A Parquet file stores data column-oriented on the disk, in batches called "row groups".

You can see where the Parquet format gets its name: the data is grouped into little squares, like a parquet floor. One of the advantages of grouping data together, is that compression routines tend to work better on data of the same type, and even more so when the data elements have the same values.
Does This Even Work?

In a word "yes", but with some caveats: Parquet has been around for several years, but the ecosystem supporting it is still, relatively, in flux. New releases of the underlying C++ libraries are still coming out regularly, the parquet_fdw is only a couple years old, and so on.

However, I was able to demonstrate to my own satisfaction that things were baked enough to be interesting.
Loading Data

I started with a handy data table of Philadelphia parking infractions, that I used in a previous blog post on spatial joins, and sorted the file by date of infraction, issue_datetime.
