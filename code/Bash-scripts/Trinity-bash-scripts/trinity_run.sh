#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/single_end-assembly_readnorm_trinity/stdout_trinity.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/single_end-assembly_readnorm_trinity/stderr_trinity.txt
#$ -j y
#$ -S /bin/bash
#$ -l mem_free=120G

wait 
/usr/local/bin/trinityrnaseq-2.1.1/Trinity --seqType fq --max_memory 120G --single /nobackup/data5/skeletonema_sex_project/test/data-test/rna-sex/RNA-sex_all.fq --bflyHeapSpaceInit 10G --bflyHeapSpaceMax 12G --CPU 12 --bflyCalculateCPU --output /nobackup/data5/skeletonema_sex_project/test/assembly-test/single_end-assembly_readnorm_trinity --normalize_max_read_cov 40
wait
echo "Done with script" 
date



