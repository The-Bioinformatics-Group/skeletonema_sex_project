#!/bin/bash
#$ -cwd
#$ -q sandbox
#$ -o stdout_trin_prepref.txt
#$ -e stderr_trin_prepref.txt
#$ -j y
#$ -S /bin/bash


wait 

/usr/local/bin/trinityrnaseq_r20140717/util/align_and_estimate_abundance.pl --transcripts /nobackup/data5/skeletonema_sex_project/test/assembly-test/assembly_test1/trinity_out_dir/Trinity.fasta --est_method RSEM --aln_method bowtie --trinity_mode --prep_reference


wait
echo "Done with script" 
date

