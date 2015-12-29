#!/bin/bash
#$ -cwd
#$ -q node0
#$ -o /nobackup/data5/skeletonema_sex_project/differential-expression-analysis/blast_searches/59athal+scere-meiosisgenes/stdout_BLAST.txt
#$ -e /nobackup/data5/skeletonema_sex_project/differential-expression-analysis/blast_searches/59athal+scere-meiosisgenes/stderr_BLAST.txt
#$ -j y
#$ -S /bin/bash
wait
ANALYSISLOC=/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/blast_searches/59athal+scere-meiosisgenes
TRANSCRIPTOME=/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/transcritpome-blast_db/skeletonema-marinoi_transcriptome_unannotated.fasta
wait
tblastn -query $ANALYSISLOC/meiosis_athal+scerv.fa -db skeletonema-marinoi_transcriptome_blastdb/skeletonema-marinoi_transcriptome_unannotated.fasta -num_alignments 5 -matrix BLOSUM62 -evalue 0.1 -gapopen 11 -gapextend 1 -word_size 6 -out $ANALYSISLOC/blastresults_only5.txt -num_threads 10 
wait
echo "Done with script" 
date
