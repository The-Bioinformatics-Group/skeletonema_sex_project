#!/bin/bash
#$ -cwd
#$ -q node0
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/transrate-eval/paired-end_assembly/stdout_transrate.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/transrate-eval/paired-end_assembly/stderr_transrate.txt
#$ -j y
#$ -S /bin/bash
wait
LOC_PAIR=/nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results 
wait
transrate --assembly /nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly/Trinity.fasta --left ${LOC_PAIR}/1F_fastq-q-filt_headerchange_sorted.fastq,${LOC_PAIR}/2F_fastq-q-filt_sorted.fastq --right ${LOC_PAIR}/1R_fastq-q-filt_headerchange_sorted.fastq,${LOC_PAIR}/2R_fastq-q-filt_sorted.fastq --output /nobackup/data5/skeletonema_sex_project/test/assembly-test/transrate-eval/paired-end_assembly/
wait
echo "Done with script" 
date
