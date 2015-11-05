#!/bin/bash
#$ -cwd
#$ -q sandbox
#$ -o stdout_sedchangepairheaderfwd.txt
#$ -e stderr_sedchangepairheaderfwd.txt
#$ -j y
#$ -S /bin/bash

wait
sed 's/ 1:N:0:.*/#0\/1/' /nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results/1F_fastq-q-filt.fq > /nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results/1F_fastq-q-filt_headerchange.fq
wait
echo "Done with script" 
date


