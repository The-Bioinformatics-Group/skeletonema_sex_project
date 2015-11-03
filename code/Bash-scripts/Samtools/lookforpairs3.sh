#!/bin/bash
#$ -cwd
#$ -q node0
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
wait
grep -e"HISEQ" $SAM | cut -d$'\t' -f"9" | grep -e "341" >> $TEMPLOC/numtemplates341bp.txt
wait
grep -e"HISEQ" $SAM | cut -d$'\t' -f"9" >> $TEMPLOC/numtemplatestotal.txt
wait
TEMPLATETOT=$(wc $TEMPLOC/numtemplatestotal.txt | cut -d" " -f2)
TEMPLNUM=$(wc $TEMPLOC/numtemplates341bp.txt | cut -d" " -f2)
wait
echo "TOTAL TEMPLATE NUM: $TEMPLATETOT "
wait
echo "TOTAL 341bp TEMPLATE NUM: $TEMPLNUM " 
wait
echo "Done with script" 
date

