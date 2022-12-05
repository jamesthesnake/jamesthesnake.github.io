Hard disks are electro-mechanical devices that wear out. Predicting their working life is something of a black art, and most influenced by the wear and tear they sustain, particularly when they’re spun up, and even their specific manufacturing batch.

Solid-state drives (SSDs) should be more predictable. Although like any solid-state electronics they can suddenly and unexpectedly die, for example if they sustain damage from spikes in power supply, the most likely cause of death of most SSDs should be when they can no longer be written to successfully any more. That occurs because there’s a limit to the number of times that each block of memory in the SSD can be erased and written to again in the program/erase cycle. Once that limit has been reached, it ceases storing data.

Wear levelling
To ensure that all the memory in an SSD ages at a consistent rate, they incorporate wear-levelling mechanisms. If those don’t function correctly, you could find some blocks of memory reaching the end of their working life while others have been barely used. We put a lot of trust into this internal wear-levelling.

Wear-levelling doesn’t come without cost. A lot of data stored doesn’t change from one month to the next. In order to ensure that all memory within an SSD has a similar level of wear, the mechanism also has to move around that more static data, which itself adds to the program/erase cycles, and increases wear. This should be most noticeable on SSDs with relatively little free space, and high write rates.

When writing changed blocks of data, unlike some older file systems, APFS doesn’t try to write the changed data to the same blocks, but uses copy-on-write to write new blocks each time. That helps wear-levelling, but can’t replace it.

Wear levelling is most efficient on SSDs with ample free space, using APFS.

TBW
There are several different ways that the working life of an SSD can be expressed, of which the most widely used is TBW, the Total Bytes Written. Manufacturers may claim or even warranty that a given SSD has a TBW of 600 TB, for example.

Taken alone, this may not appear to make sense, but examined across a range of capacities, it becomes obvious that TBW increases with increasing capacity. This is because it effectively describes how many program/erase cycles that SSD should achieve before failing. Typical values for good SSDs are around 150 TB for a capacity of 250 GB, 300 TB for 500 GB, 600 TB for 1 TB, and so on. In other words, those SSDs should be good for about 600 program/erase cycles, which may not appear many until you translate that into life span in years.

The larger the capacity of an SSD, the more data can be written to it during its working life.

Lifetime
If you know the TBW for an SSD and the total amount of data that has been written to it during its lifetime, it’s simple to estimate the percentage of its lifetime (as TBW) that has been used up, hence the amount remaining.

If my 1 TB SSD has so far written 100 TB to it, and has a TBW of 600 TB, then it has used 16.7% (one sixth) of its total life, and has 83.3% remaining.

There are only two problems here: obtaining a TBW value, and measuring the total amount of data written to the SSD.

Apple doesn’t provide TBW values for any of its internal SSDs. Not only that, but those widely used for third-party SSDs may not be reliable. Like everything else, TBW isn’t a fixed value, and different SSDs of the same model will differ in their TBW, as will different manufacturing batches. In many cases, TBW are used to determine the length of warranty, for which they will err on the safe side. You may thus find that a manufacturer sets their TBW so that they expect less than 5% of their drives to fail before reaching the TBW, to minimise the number of warranty claims they receive. The average or median TBW could thus be significantly higher.

I’ve seen it suggested that the ‘real’ TBW of modern Apple internal SSDs is anything from 600-1200 TB for a 1 TB drive. That’s a wide range of uncertainty.

Obtaining an accurate measurement of the total data written to an SSD appears simple, using S.M.A.R.T. health indicators and an app such as DriveDx, SMARTReporter or smartmontools. There are two different indicators that can be used for this:

for NVMe devices, including all recent Apple internal SSDs, this should be 007 Data Units Written, given as the number of 512-byte units;
for ATA devices, including many external SSDs, it’s likely to be 241 and 243 Total LBAs Written, where an LBA is likely to be 512 bytes.
Unfortunately, you also come across anomalous results where manufacturers appear to be using different units for reporting. It’s also unclear whether this total includes other overhead, such as that incurred by wear-levelling.

If you prefer, rather than using TBW, you can calculate the total data written per terabyte of storage capacity, which makes it easier to compare between drives of different size. That figure is effectively the number of program/erase cycles each block of memory will complete successfully before failure. If a 500 GB drive has a TBW of 300 TB, then the number of cycles before failure is 600.

Examples
Although higher TBW is generally to be preferred, for some applications low TBWs are perfectly acceptable. In more than a year of making Time Machine backups to APFS, my 2 TB external SSD has 1 TB of backups but has only written 5 TB of data. If that SSD had a low TBW of 100 TB (i.e. it could only write 50 cycles) it should still last a total of 20 years.

Backup disks shouldn’t require a high TBW

Main system storage tends to require higher TBWs. In four years of use as the only bootable system disk, the 1 TB internal SSD of my iMac Pro, with an expected TBW of at least 600 TB, has written nearly 120 TB, or 30 TB per year. To attain the expected ten-year life, the lowest that drive could be is 300 TB (300 cycles), and a TBW of anything less than 150 TB would limit its life to five years or less.

System disks need a high TBW

The combination of low drive capacity and excessive swap use is also easy to illustrate. For a 500 GB internal SSD with a TBW of 300 (equating to a good life of 600 cycles), exceeding 30 TB written per year would shorten that drive’s life below the notional ten years. Adding only 10 GB of swap writing each day would shorten that drive’s life by over a year.

High swap use and low drive capacity can result in shortened life

Key points
Wear levelling is most efficient on SSDs with ample free space, using APFS.
The larger the capacity of an SSD, the more data can be written to it during its working life.
Backup disks shouldn’t require a high TBW
System disks need a high TBW
High swap use and low drive capacity can result in shortened life
