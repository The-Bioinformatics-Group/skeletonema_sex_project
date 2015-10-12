#!/bin/bash
#$ -cwd
#$ -q sandbox
#$ -e /nobackup/data5/skeletonema_sex_project/data/rna-sex-data/stderr_joindata.txt
#$ -o /nobackup/data5/skeletonema_sex_project/data/rna-sex-data/stdout_joindata.txt
#$ -j y
#$ -S /bin/bash


#This script will join together all seperate raw RNA-sex data

wait
echo "Starting join-data script"
wait
ls /nobackup/data5/skeletonema_sex_project/data/rna-sex-data | grep -e "txt" > /nobackup/data5/skeletonema_sex_project/test/temporary_files/ls-output_joinraw.txt
wait
NUMFILES=$(wc /nobackup/data5/skeletonema_sex_project/test/temporary_files/ls-output_joinraw.txt | cut -d " " -f2)
wait
echo "There are $NUMFILES files to be joined in the specified folder"
NUM=0
for i in $(seq 1 $NUMFILES);
do
NUM=$((NUM+1))
wait
echo "Adding number $NUM file to the file RNA-sex_all_raw.txt"
wait
RNASEQFILE=$(sed "${NUM}q;d" /nobackup/data5/skeletonema_sex_project/test/temporary_files/ls-output_joinraw.txt | cut -d"." -f1)
wait
echo "Name: $RNASEQFILE "
wait
cat /nobackup/data5/skeletonema_sex_project/data/rna-sex-data/${RNASEQFILE}.txt >> /nobackup/data5/skeletonema_sex_project/data/rna-sex-data/RNA-sex_all_raw.txt
wait
echo "Done adding $RNASEQFILE to file RNA-sex_all_raw.txt"
done
wait
rm /nobackup/data5/skeletonema_sex_project/test/temporary_files/ls-output_joinraw.txt
echo "Done with script!"
date
