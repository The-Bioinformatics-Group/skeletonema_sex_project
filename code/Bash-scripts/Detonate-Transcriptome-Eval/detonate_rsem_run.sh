#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/detonate-eval/single-end_assembly/stdout_detonate.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/detonate-eval/single-end_assembly/stdout_detonate.txt
#$ -j y
#$ -S /bin/bash

wait 
rsem-eval-calculate-score /nobackup/data5/skeletonema_sex_project/test/data-test/rna-sex/RNA-sex_all.fq /nobackup/data5/skeletonema_sex_project/test/assembly-test/single_end-assembly/Trinity.fasta single_end-assembly 51 -p 4 --temporary-folder /nobackup/data5/skeletonema_sex_project/test/assembly-test/detonate-eval/single-end_assembly/detonate-temp_singleend/
wait
echo "Done with script" 
date

