#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o stdout_searchforpairs3.txt
#$ -e stderr_searchforpairs3.txt
#$ -j y
#$ -S /bin/bash
wait
TEMPLOC=/nobackup/data5/skeletonema_sex_project/test/temporary_files
FWDFILE=/nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results/1F_fastq-q-filt.fq
REVFILE=/nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results/1R_fastq-q-filt.fq
SAM=/nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly/align_and_estimate_abundance/pairedend.sam
ASSEMBLY=/nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly/Trinity.fasta
NUM=150
wait
grep -e"HISEQ" $SAM | cut -d$'\t' -f"9" >> $TEMPLOC/numtemplatestotal.txt
wait
TEMPLATETOT=$(wc $TEMPLOC/numtemplatestotal.txt | cut -d" " -f2)
wait
echo "Total templates in SAM file: $TEMPLATETOT "
for i in $(seq 1 1000);
do
NUM=$((NUM+1))
wait
grep -e "$NUM" $TEMPLOC/numtemplatestotal.txt > $TEMPLOC/numtemplatesXbp.txt
wait
TEMPLNUM=$(wc $TEMPLOC/numtemplatesXbp.txt | cut -d" " -f2)
wait
echo "Templates of $NUM in length: $TEMPLNUM " 
wait
done
echo "Done with script" 
date

