#!/bin/bash
#$ -cwd
#$ -q node0
#$ -o /nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/transcriptome_annotation/stdout_BLAST.txt
#$ -e /nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/transcriptome_annotation/stderr_BLAST.txt
#$ -j y
#$ -S /bin/bash
wait
QUERYLOC1=/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/transcriptome_annotation/references
QUERYLOC2=/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/transcriptome_annotation/references
TRANSCRIPTOME=/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/transcritpome-blast_db/skeletonema-marinoi_transcriptome_unannotated.fasta
OUTPUT=/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/transcriptome_annotation
wait
tblastn -query $QUERYLOC1/thalassiosira_pseudonana_proteinannotation.fasta -db skeletonema-marinoi_transcriptome_blastdb/skeletonema-marinoi_transcriptome_unannotated.fasta -outfmt 7 -matrix BLOSUM62 -evalue 0.01 -gapopen 11 -gapextend 1 -word_size 6 -out $OUTPUT/blastresults_outfmt7_thal.txt -num_threads 10 
wait
tblastn -query $QUERYLOC1/thalassiosira_pseudonana_proteinannotation.fasta -db skeletonema-marinoi_transcriptome_blastdb/skeletonema-marinoi_transcriptome_unannotated.fasta -outfmt 0 -matrix BLOSUM62 -evalue 0.01 -gapopen 11 -gapextend 1 -word_size 6 -out $OUTPUT/blastresults_outfmt0_thal.txt -num_threads 10
wait
tblastn -query $QUERYLOC2/phaeodactylum_tricornutum_proteinannotation.fasta -db skeletonema-marinoi_transcriptome_blastdb/skeletonema-marinoi_transcriptome_unannotated.fasta -outfmt 7 -matrix BLOSUM62 -evalue 0.01 -gapopen 11 -gapextend 1 -word_size 6 -out $OUTPUT/blastresults_outfmt7_phaeoda.txt -num_threads 10 
wait
tblastn -query $QUERYLOC2/phaeodactylum_tricornutum_proteinannotation.fasta -db skeletonema-marinoi_transcriptome_blastdb/skeletonema-marinoi_transcriptome_unannotated.fasta -outfmt 0 -matrix BLOSUM62 -evalue 0.01 -gapopen 11 -gapextend 1 -word_size 6 -out $OUTPUT/blastresults_outfmt0_phaeoda.txt -num_threads 10
wait
echo "Done with script" 
date
