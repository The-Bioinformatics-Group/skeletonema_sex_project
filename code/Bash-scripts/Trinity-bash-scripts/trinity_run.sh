#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/single_end-assembly_readnorm/stdout_trinity.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/single_end-assembly_readnorm/stderr_trinity.txt
#$ -j y
#$ -S /bin/bash
#$ -l mem_free=120G
wait 

Trinity --seqType fq --JM 120G --single /nobackup/data5/skeletonema_sex_project/test/data-test/rna-sex/RNA-sex_all.fq --bflyHeapSpaceInit 10G --bflyHeapSpaceMax 12G --CPU 12 --bflyCalculateCPU --output /nobackup/data5/skeletonema_sex_project/test/assembly-test/single_end-assembly_readnorm --normalize_max_read cov 40

wait
echo "Done with script" 
date



