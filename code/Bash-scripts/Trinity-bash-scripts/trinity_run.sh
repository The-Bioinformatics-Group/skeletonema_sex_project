#!/bin/bash
#$ -cwd
#$ -q ?
#$ -o stdout_trinity.txt
#$ -e stderr_trinity.txt
#$ -j y
#$ -S /bin/bash
#$ -l mem_free 100

wait 

Trinity --seqType fq --JM 20G --single /state/partition2/mathias/C6D2PACXX-All.txt
 --CPU 6 --bflyCalculateCPU --output /nobackup/data5/skeletonema_sex_project/data/trinity_assembly

wait
echo "Done with script" 
date



