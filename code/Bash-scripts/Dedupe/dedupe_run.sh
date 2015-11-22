#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/mega-assembly_trinity/treated-assemblies/stdout_dedupe.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/mega-assembly_trinity/treated-assemblies/stderr_dedupe.txt
#$ -j y
#$ -S /bin/bash
wait
SOFTWARE=/nobackup/data5/skeletonema_sex_project/software/bbmap/dedupe.sh
ASSEMBLY=/nobackup/data5/skeletonema_sex_project/test/assembly-test/mega-assembly_trinity
OUTPUT=/nobackup/data5/skeletonema_sex_project/test/assembly-test/mega-assembly_trinity/treated-assemblies
wait
$SOFTWARE in=$ASSEMBLY/Trinity.fasta out=$OUTPUT/mega-assembly-dedupe1.fq t=10 
wait
echo "Done with script" 
date
