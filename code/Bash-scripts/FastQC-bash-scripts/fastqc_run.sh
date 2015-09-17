#!/bin/bash
#$ -cwd
#$ -q sandbox
#$ -o stdout_fastqc.txt
#$ -e stderr_fastqc.txt
#$ -j y
#$ -S /bin/bash

fastqc -t 4 -o /nobackup/data5/skeletonema_sex_project/data/fastqc_results -f fastq /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_CL10_15s010306-1-1_Ferrante_lane115s010306_sequence.txt

wait
echo "Done with script" date



