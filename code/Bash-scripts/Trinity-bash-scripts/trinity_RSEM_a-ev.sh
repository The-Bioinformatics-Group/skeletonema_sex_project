#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o stdout_trin_RSEM.txt
#$ -e stderr_trin_RSEM.txt
#$ -j y
#$ -S /bin/bash


wait 

/usr/local/bin/trinityrnaseq_r20140717/util/align_and_estimate_abundance.pl --transcripts /nobackup/data5/skeletonema_sex_project/test/assembly-test/assembly_test1/trinity_out_dir/Trinity.fasta --seqType fq --single /nobackup/data5/skeletonema_sex_project/data/CL10.txt --est_method RSEM --aln_method bowtie --trinity_mode


wait
echo "Done with script" 
date

