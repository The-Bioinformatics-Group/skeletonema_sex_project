#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/4/transrate/3merged_settings4/badcontigs/detonate/stdout_detonate.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/4/transrate/3merged_settings4/badcontigs/detonate/stderr_detonate.txt
#$ -j y
#$ -S /bin/bash
wait
ASSEMBLY=badcontigs_singleendalignment
ASSLOC=/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/4/transrate/3merged_settings4/badcontigs/bad.3merged_settings4.fasta
DATA=/nobackup/data5/skeletonema_sex_project/test/data-test/rna-sex/RNA-sex_all.fq
OUTPUT=/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/4/transrate/3merged_settings4/badcontigs/detonate
wait 
rsem-eval-calculate-score --num-threads 20 $DATA $ASSLOC $ASSEMBLY 51 --temporary-folder $OUTPUT --transcript-length-mean 1556.003 --transcript-length-sd 1289.489
wait
echo "Done with script" 
date

