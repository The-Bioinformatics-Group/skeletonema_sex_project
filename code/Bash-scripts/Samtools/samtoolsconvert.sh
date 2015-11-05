#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly/align_and_estimate_abundance/stdout_SAMtoolsConvert.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly/align_and_estimate_abundance/stderr_SAMtoolsConvert.txt
#$ -j y
#$ -S /bin/bash


wait
samtools view -h -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly/align_and_estimate_abundance/pairedend.sam /nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly/align_and_estimate_abundance/bowtie.csorted.bam
wait
echo "Done with script" 
date

