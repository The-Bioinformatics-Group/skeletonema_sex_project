#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/mega-assembly_trinity/bowtieindex/stdout_bowtieindex.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/mega-assembly_trinity/bowtieindex/stderr_bowtieindex.txt
#$ -j y
#$ -S /bin/bash
wait
ASSEMBLY=/nobackup/data5/skeletonema_sex_project/test/assembly-test/mega-assembly_trinity/Trinity.fasta
wait
bowtie2-build $ASSEMBLY mega-assembly-bowtie2-ref 
wait
echo "Done with script" 
date
