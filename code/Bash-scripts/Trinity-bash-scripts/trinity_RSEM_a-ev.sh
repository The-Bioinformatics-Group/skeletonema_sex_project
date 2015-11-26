#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly/align_and_estimate_abundance/stdout_trin_RSEM.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly/align_and_estimate_abundance/stderr_trin_RSEM.txt
#$ -j y
#$ -S /bin/bash


wait 

/usr/local/bin/trinityrnaseq_r20140717/util/align_and_estimate_abundance.pl --transcripts /nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly/Trinity.fasta --seqType fq --left /nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results/1F_fastq-q-filt_headerchange_sorted.fastq --right /nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results/1R_fastq-q-filt_headerchange_sorted.fastq --est_method RSEM --coordsort_bam --aln_method bowtie --trinity_mode --output_dir /nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly/align_and_estimate_abundance



wait
echo "Done with script" 
date

