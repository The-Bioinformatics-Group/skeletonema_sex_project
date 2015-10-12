#!/bin/bash
#$ -cwd
#$ -q sandbox
#$ -o stdout_fastqc_pairend.txt
#$ -e stderr_fastqc_pairend.txt
#$ -j y
#$ -S /bin/bash

wait

fastqc -t 4 -o /nobackup/data5/skeletonema_sex_project/data/fastqc-results-sandrasdata/1F_adapt_trimmed -f fastq /nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/1F_adapttrim.txt


wait
echo "Done with script" 
date



