#!/bin/bash
#$ -cwd
#$ -q sandbox
#$ -o stdout_fastqc.txt
#$ -e stderr_fastqc.txt
#$ -j y
#$ -S /bin/bash

mkdir /nobackup/data5/skeletonema_sex_project/data/fastqc_results/NoCL9
wait

fastqc -t 4 -o /nobackup/data5/skeletonema_sex_project/data/fastqc_results/NoCL9 -f fastq /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_NoCL9_15s010305-1-1_Ferrante_lane115s010305_sequence.txt
wait
echo "Done with script" 
date



