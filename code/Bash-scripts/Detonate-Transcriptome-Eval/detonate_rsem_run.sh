#!/bin/bash
#$ -cwd
#$ -q sandbox
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/assembly_test1/stdout_detonate.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/assembly_test1/stdout_detonate.txt
#$ -j y
#$ -S /bin/bash

wait 
rsem-eval-calculate-score /nobackup/data5/skeletonema_sex_project/data/rna-sex-data/RNA-sex_all_raw.txt /nobackup/data5/skeletonema_sex_project/test/assembly-test/assembly_test1/trinity_out_dir/Trinity.fasta test_assembly_1 51 -p 4 --temporary-folder /nobackup/data5/skeletonema_sex_project/test/assembly-test/assembly_test1/detonate-temp/
wait
echo "Done with script" 
date



