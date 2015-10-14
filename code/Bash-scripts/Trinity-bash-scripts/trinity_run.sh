#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/single_end-assembly/stdout_trinity.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/single_end-assembly/stderr_trinity.txt
#$ -j y
#$ -S /bin/bash
#$ -l mem_free=100G
wait 

Trinity --seqType fq --JM 20G --single /nobackup/data5/skeletonema_sex_project/test/data-test/rna-sex/RNA-sex_all.fq --CPU 8 --bflyCalculateCPU --output /nobackup/data5/skeletonema_sex_project/test/assembly-test/single_end-assembly

wait
echo "Done with script" 
date



