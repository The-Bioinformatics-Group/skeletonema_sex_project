#!/bin/bash
#$ -cwd
#$ -q node0
#$ -o /nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/cd-hit-est-Reversetest/stdout_CD-HIT-EST.txt
#$ -e /nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/cd-hit-est-Reversetest/stderr-CDHITEST.txt
#$ -j y
#$ -S /bin/bash
wait
SOFTWARE=/nobackup/data5/skeletonema_sex_project/software/cdhit-master/cd-hit-est
ASSEMBLY=/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/skeletonema-marinoi_transcriptome_unannotated.fasta
OUTPUT=/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/cd-hit-est-Reversetest
wait
$SOFTWARE -i $ASSEMBLY -o $OUTPUT/transcriptome-cdhitestreversetest.fasta -T 4 -M 20000 -n 10 -c 0.94 -r 1 
wait
echo "Done with script" 
date
