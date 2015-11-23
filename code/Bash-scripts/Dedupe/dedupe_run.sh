#!/bin/bash
#$ -cwd
#$ -q node0
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly/dedupe_run1/stdout_dedupe.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly/dedupe_run1/stderr_dedupe.txt
#$ -j y
#$ -S /bin/bash
wait
SOFTWARE=/nobackup/data5/skeletonema_sex_project/software/bbmap/dedupe.sh
ASSEMBLY=/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly/singleend+pairedend-trinity.fasta
OUTPUT=/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly/dedupe_run1
wait
$SOFTWARE in=$ASSEMBLY out=$OUTPUT/mega-assembly-dedupe1.fq t=4
wait
echo "Done with script" 
date
