#!/bin/bash
#$ -cwd
#$ -q node0
#$ -o /nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/transcriptome_annotation/references/stdout_makedatabase.txt
#$ -e /nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/transcriptome_annotation/references/stderr_makedatabase.txt
#$ -j y
#$ -S /bin/bash
wait
LOCATION=/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/transcriptome_annotation/references
wait
makeblastdb -in $LOCATION/thalassiosira_pseudonana_proteinannotation.fasta -dbtype prot
wait
makeblastdb -in $LOCATION/phaeodactylum_tricornutum_proteinannotation.fasta -dbtype prot
wait
echo "Done with script" 
date
