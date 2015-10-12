#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/assembly_test3/stdout_trinity.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/assembly_test3/stderr_trinity.txt
#$ -j y
#$ -S /bin/bash
#$ -l mem_free=100G
wait 

Trinity --seqType fq --JM 20G --single /nobackup/data5/skeletonema_sex_project/data/rna-sex-data/RNA-sex_all_raw.txt --normalize_max_read_cov 50 --CPU 6 --bflyCalculateCPU --output /nobackup/data5/skeletonema_sex_project/test/assembly-test/assembly_test3

wait
echo "Done with script" 
date



