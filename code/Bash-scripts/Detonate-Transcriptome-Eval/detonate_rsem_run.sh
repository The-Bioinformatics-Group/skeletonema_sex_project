#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/detonate-eval/paired-end-assembly/stdout_detonate.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/detonate-eval/paired-end-assembly/stdout_detonate.txt
#$ -j y
#$ -S /bin/bash
wait
LOC_SINGLE=/nobackup/data5/skeletonema_sex_project/test/data-test/rna-sex
LOC_PAIR=/nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results
wait 
rsem-eval-calculate-score --paired-end ${LOC_PAIR}/1F_fastq-q-filt_sorted.fastq,${LOC_PAIR}/2F_fastq-q-filt_sorted.fastq ${LOC_PAIR}/1R_fastq-q-filt_sorted.fastq,${LOC_PAIR}/2R_fastq-q-filt_sorted.fastq /nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly/Trinity.fasta paired-end-assembly 586 -p 4 --temporary-folder /nobackup/data5/skeletonema_sex_project/test/assembly-test/detonate-eval/paired-end-assembly/detonate-temp_paired-end-assembly/
wait
echo "Done with script" 
date

