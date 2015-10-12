##This is the test folder for data

In this folder different versions of quality-filtered reads will be saved.

###Overview

The folder contains trimmed and quality-filtered data from both singleend reads and pairend reads from Skeletonema RNA-seq. 
The plan is to use these data-sets to produce a reference transcriptome assembly using Trinity. 
In the first assembly all data will be joined together to produce one big assembly with one run of Trinity, in this process the strand-specific data will be lost which is a detriment, however a benefit is that potential low-copy number transcripts will have more supporting reads and thereby produce a more complete transcriptome regardless. 
The second assembly will be made out of two seperate Trinity assemblies where the single end data is assembled seperately from the pairend-assembly, and the joined together afterwards. This has the benefit of not losing the strand specific information, but without the aforementioned benefit of the "big-assembly".
