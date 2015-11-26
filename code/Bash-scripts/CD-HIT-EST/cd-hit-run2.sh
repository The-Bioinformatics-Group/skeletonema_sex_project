#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_transratefilteredpairedend/dedupe1/cd-hit-est2/stdout_CD-HIT-EST2.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_transratefilteredpairedend/dedupe1/cd-hit-est2/stderr_CD-HIT-EST2.txt
#$ -j y
#$ -S /bin/bash
wait
SOFTWARE=/nobackup/data5/skeletonema_sex_project/software/cdhit-master/cd-hit-est
ASSEMBLY=/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_transratefilteredpairedend/dedupe1/merged-assembly2-dedupe1.fq
OUTPUT=/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_transratefilteredpairedend/dedupe1/cd-hit-est2
wait
$SOFTWARE -i $ASSEMBLY -o $OUTPUT/merged2-dedupe1cdhitest2.fq -c 0.95 -n 10 -T 4 -M 20000 
wait
echo "Done with script" 
date
