#!/bin/bash
#$ -cwd
#$ -q node0
#$ -e /nobackup/data5/skeletonema_sex_project/test/data-test/rna-sex/cutadapts_reports/stderr_cutadapt.txt
#$ -o /nobackup/data5/skeletonema_sex_project/test/data-test/rna-sex/cutadapts_reports/stdout_cutadapt.txt
#$ -j y
#$ -S /bin/bash


#This script will run cutadapt with specific settings on all .txt files in the specified input-folder.

#b: Search for adapters in -b
#q: Trim low quality ends from reads before adapter removal, set to phred 15 in this case
#O: Minimum overlap length between adapter and read. If overlap is less than O, the read is unmodified
#e: Maximum allowed error rate. Number of errors divided by length of matching region. 0.1 = 1 in 10
#n: Try to remove adapters at most COUNT times.
#m: Discard trimmed reads that are shorter than LENGTH.
#f: Format, fastq
wait
echo "Starting cutadapt script"
wait
ls /nobackup/data5/skeletonema_sex_project/data/rna-sex-data/ | grep -e "txt" > /nobackup/data5/skeletonema_sex_project/test/temporary_files/ls-output.txt
wait
NUMFILES=$(wc /nobackup/data5/skeletonema_sex_project/test/temporary_files/ls-output.txt | cut -d " " -f2)
wait
echo "There are $NUMFILES files to be modified in the specified folder"
NUM=0
for i in $(seq 1 $NUMFILES);
do
NUM=$((NUM+1))
wait
echo "Starting cutadapt on file: $NUM "
wait
RNASEQFILE=$(sed "${NUM}q;d" /nobackup/data5/skeletonema_sex_project/test/temporary_files/ls-output.txt | cut -d"." -f1)
wait
echo "Name: $RNASEQFILE "
wait
cutadapt -b AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACATCACGATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACCGATGTATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACTTAGGCATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACTGACCAATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACGCCAATATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACCAGATCATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACACTTGAATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACGATCAGATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACTAGCTTATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACGGCTACATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACCTTGTAATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACCGGTGTATCTCGTATGCCGTCTT -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACAGCGATAGATCTCGTAT -q 15 -O 10 -e 0.1 -n 1 -m 50 -f fastq -o /nobackup/data5/skeletonema_sex_project/test/data-test/rna-sex/cutadapts_results/$RNASEQFILE/${RNASEQFILE}_adaptrim.fq /nobackup/data5/skeletonema_sex_project/data/rna-sex-data/${RNASEQFILE}.txt
wait
echo "Done with cutting adaptors of ${RNASEQFILE}"
done
wait
rm /nobackup/data5/skeletonema_sex_project/test/temporary_files/ls-output.txt
echo "Done with script!"
date
