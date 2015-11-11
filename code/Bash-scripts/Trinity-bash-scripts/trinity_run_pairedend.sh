#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_sorted+readnorm_trinity/stdout_trinity.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_sorted+readnorm_trinity/stderr_trinity.txt
#$ -j y
#$ -S /bin/bash
#$ -l mem_free=140G
wait
LOC_PAIR=/nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results
wait 
Trinity --seqType fq --max_memory 140G --SS_lib_type FR --left ${LOC_PAIR}/1F_sorted+singletons.fq,${LOC_PAIR}/2F_sorted+singletons.fq --right ${LOC_PAIR}/1R_sorted+singletons.fq,${LOC_PAIR}/2R_sorted+singletons.fq --CPU 14 --bflyHeapSpaceInit 10G --bflyHeapSpaceMax 12G --bflyCalculateCPU --output /nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_sorted+readnorm_trinity --normalize_max_read_cov 40
wait
echo "Done with script" 
date



