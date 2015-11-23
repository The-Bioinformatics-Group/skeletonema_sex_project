#!/bin/bash
#$ -cwd
#$ -q node0
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly/dedupe_run1/cd-hit-est1/stdout_CD-HIT-EST.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly/dedupe_run1/cd-hit-est1/stderr_CD-HIT-EST.txt
#$ -j y
#$ -S /bin/bash
wait
SOFTWARE=/nobackup/data5/skeletonema_sex_project/software/cdhit-master/cd-hit-est
ASSEMBLY=/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly/dedupe_run1/merged-assembly-dedupe1.fq
OUTPUT=/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly/dedupe_run1/cd-hit-est1
wait
$SOFTWARE -i $ASSEMBLY -o $OUTPUT/merged_settings1.fasta -c 0.95 -n 10 -s 0.90 -T 4 -M 4000 
wait
echo "Done with script" 
date
