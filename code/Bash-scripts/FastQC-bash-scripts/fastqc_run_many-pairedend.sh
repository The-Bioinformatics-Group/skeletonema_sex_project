#!/bin/bash
#$ -cwd
#$ -q sandbox
#$ -e /nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results/FastQC-report/stderr_fastqc.txt
#$ -o /nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results/FastQC-report/stdout_fastqc.txt
#$ -j y
#$ -S /bin/bash


#This script will run FastQC analysis on all files in specified directory ending with .txt

wait
echo "Starting fastqc script"
wait
ls /nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results | grep -e "txt" | grep -v "readcount" > /nobackup/data5/skeletonema_sex_project/test/temporary_files/ls-output_fastqc_pair.txt
wait
NUMFILES=$(wc /nobackup/data5/skeletonema_sex_project/test/temporary_files/ls-output_fastqc_pair.txt | cut -d " " -f2)
wait
echo "There are $NUMFILES files to be evaluated in the specified folder"
NUM=0
for i in $(seq 1 $NUMFILES);
do
NUM=$((NUM+1))
wait
echo "Evaluating number $NUM "
wait
RNASEQFILE=$(sed "${NUM}q;d" /nobackup/data5/skeletonema_sex_project/test/temporary_files/ls-output_fastqc_pair.txt | cut -d"_" -f1)
wait
echo "Name: $RNASEQFILE "
wait
mkdir /nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results/FastQC-report/$RNASEQFILE
wait
fastqc -t 4 -o /nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results/FastQC-report/$RNASEQFILE -f fastq /nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results/${RNASEQFILE}_fastq-q-filt.txt
wait
echo "Done evaluating $RNASEQFILE "
done
wait
rm /nobackup/data5/skeletonema_sex_project/test/temporary_files/ls-output_fastqc_pair.txt
echo "Done with script!"
date
