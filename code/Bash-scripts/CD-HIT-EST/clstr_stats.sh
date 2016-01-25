#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/stdout_clstrtest.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/stderr_clstrtest.txt
#$ -j y
#$ -S /bin/bash
wait
SOFTWARE1=/nobackup/data5/skeletonema_sex_project/software/cdhit-master/clstr_size_stat.pl
SOFTWARE2=/nobackup/data5/skeletonema_sex_project/software/cdhit-master/clstr_size_histogram.pl
INP=/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est
NUM=7
wait
for i in $(seq 1 1);
do
NUM=$((NUM+1))
wait
echo "Starting on $NUM "
wait
$SOFTWARE1 $INP/test/3merged_settingstest.fasta.clstr > /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/test/clstr_size_stat.txt
$SOFTWARE2 -bin 1 $INP/test/3merged_settingstest.fasta.clstr > /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/test/clstr_size_histogram
wait
done
echo "Done with script" 
date
