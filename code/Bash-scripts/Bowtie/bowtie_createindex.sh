#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/merged_assemblies/bowtieindex/stdout_bowtieindex.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/merged_assemblies/bowtieindex/stderr_bowtieindex.txt
#$ -j y
#$ -S /bin/bash
wait
ASSEMBLY=/nobackup/data5/skeletonema_sex_project/test/assembly-test/merged_assemblies/singleend+pairedend-trinity.fasta
wait
bowtie2-build $ASSEMBLY merged_assemblies-bowtie2-ref 
wait
echo "Done with script" 
date
