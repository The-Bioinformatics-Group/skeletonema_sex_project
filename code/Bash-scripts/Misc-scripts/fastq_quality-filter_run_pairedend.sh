#!/bin/bash
#$ -cwd
#$ -q sandbox
#$ -e /nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_reports/stderr_quality_filterPairedEnd.txt
#$ -o /nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_reports/stdout_quality_filterPairedEnd.txt
#$ -j y
#$ -S /bin/bash


#This script will run fastq-quality-filter with specific settings on all .txt files in the specified input-folder.

#q: Minimum quality score to keep.
#p: Minimum percent of bases that must have [-q] quality.

wait
echo "Starting fastq_quality_filter script"
wait
ls /nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/cutadapts_results | grep -e "txt" > /nobackup/data5/skeletonema_sex_project/test/temporary_files/ls-output2.txt
wait
NUMFILES=$(wc /nobackup/data5/skeletonema_sex_project/test/temporary_files/ls-output2.txt | cut -d " " -f2)
wait
echo "There are $NUMFILES files to be modified in the specified folder"
NUM=0
for i in $(seq 1 $NUMFILES);
do
NUM=$((NUM+1))
wait
echo "Starting fastq_quality_filter on file: $NUM "
wait
RNASEQFILE=$(sed "${NUM}q;d" /nobackup/data5/skeletonema_sex_project/test/temporary_files/ls-output2.txt | cut -d"_" -f1)
wait
echo "Name: $RNASEQFILE "
wait
fastq_quality_filter -Q33 -q 20 -p 95 -i /nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/cutadapts_results/${RNASEQFILE}_adaptrim.txt -o /nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results/${RNASEQFILE}_fastq-q-filt.txt > /nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_reports/${RNASEQFILE}_output-report.txt
wait
echo "Done with quality-filtering of ${RNASEQFILE}"
done
wait
rm /nobackup/data5/skeletonema_sex_project/test/temporary_files/ls-output2.txt
echo "Done with script!"
date
