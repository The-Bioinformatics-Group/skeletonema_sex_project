#!/bin/bash
#$ -cwd
#$ -q sandbox
#$ -o 
#$ -e 
#$ -j y
#$ -S /bin/bash

wait 
~/home/mathias/detonate-1.10/rsem-eval/rsem-eval-calculate-score /nobackup/data5/skeletonema_sex_project/data/rna-sex-data/RNA-sex_all_raw.txt /nobackup/data5/skeletonema_sex_project/test/assembly-test/assembly_test1/trinity_out_dir/Trinity.fasta test_assembly_1 --temporary-folder /nobackup/data5/skeletonema_sex_project/test/assembly-test/assembly_test1/detonate-temp/
wait
echo "Done with script" 
date



