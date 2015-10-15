#!/bin/bash
#$ -cwd
#$ -q sandbox
#$ -o /test/data-test/rna-sex/fastq_quality_filter_results/stdout_fastqc_readcount-postfilt.txt
#$ -e /test/data-test/rna-sex/fastq_quality_filter_results/stderr_fastqc_readcount-postfilt.txt
#$ -j y
#$ -S /bin/bash

wait
echo "This script will count total reads from fastqc_data.txt before and after trimming + quality-filtering"
wait
ls /nobackup/data5/skeletonema_sex_project/data/rna-sex-data/ | grep -e "txt" | grep -v "_" > /nobackup/data5/skeletonema_sex_project/test/temporary_files/fastqc_countreads.txt
wait
NUMFILES=$(wc /nobackup/data5/skeletonema_sex_project/test/temporary_files/fastqc_countreads.txt | cut -d " " -f2)
wait
NUM=0
for i in $(seq 1 $NUMFILES);
do
NUM=$((NUM+1))
wait
FILE=$(sed "${NUM}q;d" /nobackup/data5/skeletonema_sex_project/test/temporary_files/fastqc_countreads.txt | cut -d"." -f1)
wait
LOCBEFORE=$(/nobackup/data5/skeletonema_sex_project/data/rna-sex-data/fastqc_results/$FILE/C6D2PACXX_${FILE}_*)
LOCAFTER=$(/test/data-test/rna-sex/fastq_quality_filter_results/FastQC-report/$FILE/${FILE}_fastq-q-filt_fastqc)
wait
READSBEFORE=$(grep -e "Total Sequences" $LOCBEFORE/fastqc_data.txt | cut -f2)
READSAFTER=$(grep -e "Total Sequences" $LOCAFTER/fastqc_data.txt | cut -f2)
wait
LOSTREADS=$((${READSBEFORE}-${READSAFTER}))
wait
PERREADS=$(${LOSTREADS}/${READSBEFORE} | bc -l)
wait
echo "Reads lost from of $FILE : $LOSTREADS "
echo "Percentage reads lost from $FILE : $PERREADS "
done
wait
rm /nobackup/data5/skeletonema_sex_project/test/temporary_files/fastqc_countreads.txt
wait
echo "Done with script" 
date


