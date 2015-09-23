#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o stdout_trinity.txt
#$ -e stderr_trinity.txt
#$ -j y
#$ -S /bin/bash
#$ -l mem_free=20G

wait 

Trinity --seqType fq --JM 20G --single /state/partition2/mathias/C6D2PACXX-All.txt
 --CPU 6 --output /nobackup/data5/skeletonema_sex_project/data/trinity_assembly

wait
echo "Done with script" 
date



