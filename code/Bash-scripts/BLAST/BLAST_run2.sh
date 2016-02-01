#!/bin/bash
#$ -cwd
#$ -q node0
#$ -o /nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/transcriptome_annotation/transcriptome-vs-proteinref/stdout_BLASTx_annotation.txt
#$ -e /nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/transcriptome_annotation/transcriptome-vs-proteinref/stderr_BLASTx_annotation.txt
#$ -j y
#$ -S /bin/bash
wait
QUERYLOC1=/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/transcriptome_annotation/references/thal_database/thalassiosira_pseudonana_proteinannotation.fasta
QUERYLOC2=/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/transcriptome_annotation/references/phaeda_database/phaeodactylum_tricornutum_proteinannotation.fasta
TRANSCRIPTOME=/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/transcriptome-blast_db/skeletonema-marinoi_transcriptome_unannotated.fasta
OUTPUT=/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/transcriptome_annotation/transcriptome-vs-proteinref
wait
blastx -query $TRANSCRIPTOME -db $QUERYLOC1 -outfmt 7 -matrix BLOSUM62 -evalue 0.01 -gapopen 11 -gapextend 1 -word_size 6 -out $OUTPUT/blastresults_outfmt7_transcriptomevsthal.txt -num_threads 10 
wait
blastx -query $TRANSCRIPTOME -db $QUERYLOC1 -outfmt 0 -matrix BLOSUM62 -evalue 0.01 -gapopen 11 -gapextend 1 -word_size 6 -out $OUTPUT/blastresults_outfmt0_transcriptomevsthal.txt -num_threads 10
wait
blastx -query $TRANSCRIPTOME -db $QUERYLOC2 -outfmt 7 -matrix BLOSUM62 -evalue 0.01 -gapopen 11 -gapextend 1 -word_size 6 -out $OUTPUT/blastresults_outfmt7_transcriptomevsphaeoda.txt -num_threads 10 
wait
blastx -query $TRANSCRIPTOME -db $QUERYLOC2 -outfmt 0 -matrix BLOSUM62 -evalue 0.01 -gapopen 11 -gapextend 1 -word_size 6 -out $OUTPUT/blastresults_outfmt0_transcriptomevsphaeoda.txt -num_threads 10
wait
echo "Done with script" 
date
