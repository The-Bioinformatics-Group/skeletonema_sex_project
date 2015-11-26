#!/bin/bash
#$ -cwd
#$ -q sandbox
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/mega-assembly/treated-assemblies/cd-hit-est-dedupe1/cd-hit-est3/stdout_CD-HIT-EST3.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/mega-assembly/treated-assemblies/cd-hit-est-dedupe1/cd-hit-est3/stderr-CDHITEST3.txt
#$ -j y
#$ -S /bin/bash
wait
SOFTWARE=/nobackup/data5/skeletonema_sex_project/software/cdhit-master/cd-hit-est
ASSEMBLY=/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/mega-assembly/treated-assemblies/cd-hit-est-dedupe1/mega-assembly-dedupe1.fq
OUTPUT=/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/mega-assembly/treated-assemblies/cd-hit-est-dedupe1/cd-hit-est3
wait
$SOFTWARE -i $ASSEMBLY -o $OUTPUT/megaassembly_settings3.fasta -T 4 -M 4000 -c 0.99 -G 0 -aL 0.90 -AL 100 -aS 0.99 -AS 30 
wait
echo "Done with script" 
date
