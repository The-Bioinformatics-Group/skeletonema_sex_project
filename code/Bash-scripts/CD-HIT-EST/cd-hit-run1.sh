#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly1/stdout_CD-HIT-EST.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly1/stderr_CD-HIT-EST.txt
#$ -j y
#$ -S /bin/bash
wait
SOFTWARE=/nobackup/data5/skeletonema_sex_project/software/cdhit-master/cd-hit-est
ASSEMBLY=/nobackup/data5/skeletonema_sex_project/test/assembly-test/singleend+pairedend-trinity.fasta
OUTPUT=/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly1
wait
$SOFTWARE -i $ASSEMBLY -o $OUTPUT/merged_settings1.fasta -c 0.99 -n 10 -s 0.95 -T 4 -M 20000 
wait
echo "Done with script" 
date
