#!/bin/bash
#$ -cwd
#$ -q sandbox
#$ -e /nobackup/data5/skeletonema_sex_project/test/data-test/rna-sex/stderr_joindata.txt
#$ -o /nobackup/data5/skeletonema_sex_project/test/data-test/rna-sex/stdout_joindata.txt
#$ -j y
#$ -S /bin/bash


#This script will join together all seperate RNA-sex data files after they have been trimmed and filtered.

wait
echo "Starting join-data script"
wait
ls /nobackup/data5/skeletonema_sex_project/test/data-test/rna-sex/fastq_quality_filter_results | grep -e "txt" > /nobackup/data5/skeletonema_sex_project/test/temporary_files/ls-output.txt
wait
NUMFILES=$(wc /nobackup/data5/skeletonema_sex_project/test/temporary_files/ls-output.txt | cut -d " " -f2)
wait
echo "There are $NUMFILES files to be joined in the specified folder"
NUM=0
for i in $(seq 1 $NUMFILES);
do
NUM=$((NUM+1))
wait
echo "Adding number $NUM file to the file RNA-sex_all.fq"
wait
RNASEQFILE=$(sed "${NUM}q;d" /nobackup/data5/skeletonema_sex_project/test/temporary_files/ls-output.txt | cut -d"_" -f1)
wait
echo "Name: $RNASEQFILE "
wait
cat /nobackup/data5/skeletonema_sex_project/test/data-test/rna-sex/fastq_quality_filter_results/${RNASEQFILE}_* >> /nobackup/data5/skeletonema_sex_project/test/data-test/rna-sex/RNA-sex_all.fq
wait
echo "Done adding $RNASEQFILE to file RNA-sex_all.fq"
done
wait
rm /nobackup/data5/skeletonema_sex_project/test/temporary_files/ls-output.txt
echo "Done with script!"
date
