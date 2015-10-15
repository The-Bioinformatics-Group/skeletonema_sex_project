#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end-assembly/stdout_trinity.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end-assembly/stderr_trinity.txt
#$ -j y
#$ -S /bin/bash
#$ -l mem_free=100G
wait
LOC_PAIR=/nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results
wait 
Trinity --seqType fq --JM 20G --SS_lib_type FR --left ${LOC_PAIR}/1F_fastq-q-filt.txt,${LOC_PAIR}/2F_fastq-q-filt.txt --right --right ${LOC_PAIR}/1R_fastq-q-filt.txt,${LOC_PAIR}/2R_fastq-q-filt.txt --CPU 8 --bflyCalculateCPU --output /nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly
wait
echo "Done with script" 
date



