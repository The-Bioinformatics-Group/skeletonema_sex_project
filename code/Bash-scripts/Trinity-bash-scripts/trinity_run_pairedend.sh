#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly+readnorm/stdout_trinity.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly+readnorm/stderr_trinity.txt
#$ -j y
#$ -S /bin/bash
#$ -l mem_free=240G
wait
LOC_PAIR=/nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results
wait 
Trinity --seqType fq --max_memory 240 --SS_lib_type FR --left ${LOC_PAIR}/1F_fastq-q-filt.txt,${LOC_PAIR}/2F_fastq-q-filt.txt --right ${LOC_PAIR}/1R_fastq-q-filt.txt,${LOC_PAIR}/2R_fastq-q-filt.txt --CPU 24 --bflyHeapSpaceInit 10G --bflyHeapSpaceMax 12G --bflyCalculateCPU --output /nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly --normalize_max_read_cov 40
wait
echo "Done with script" 
date



