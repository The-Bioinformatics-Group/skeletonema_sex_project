#!/bin/bash
#$ -cwd
#$ -q node0
#$ -o /nobackup/data5/skeletonema_sex_project/differential-expression-analysis/blast_searches/stdout_tBLASTn.txt
#$ -e /nobackup/data5/skeletonema_sex_project/differential-expression-analysis/blast_searches/stderr_tBLASTn.txt
#$ -j y
#$ -S /bin/bash
wait
QUERYLOC1=/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/blast_searches/58athal+scere-meiosisgenes
QUERYLOC2=/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/blast_searches/flagellagenes
TRANSCRIPTOME=/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/transcriptome-blast_db/skeletonema-marinoi_transcriptome_unannotated.fasta
wait
tblastn -query $QUERYLOC1/meiosis_athal+scerv.fa -db $TRANSCRIPTOME -outfmt 7 -matrix BLOSUM62 -evalue 0.01 -gapopen 11 -gapextend 1 -word_size 6 -out $QUERYLOC1/blastresults_outfmt7_58meiosisgenes.txt -num_threads 10 
wait
tblastn -query $QUERYLOC1/meiosis_athal+scerv.fa -db $TRANSCRIPTOME -outfmt 0 -matrix BLOSUM62 -evalue 0.01 -gapopen 11 -gapextend 1 -word_size 6 -out $QUERYLOC1/blastresults_outfmt0_58meiosisgenes.txt -num_threads 10
wait
tblastn -query $QUERYLOC2/flagella_seq.fasta -db $TRANSCRIPTOME -outfmt 7 -matrix BLOSUM62 -evalue 0.01 -gapopen 11 -gapextend 1 -word_size 6 -out $QUERYLOC2/blastresults_outfmt7_flagella.txt -num_threads 10 
wait
tblastn -query $QUERYLOC2/flagella_seq.fasta -db $TRANSCRIPTOME -outfmt 0 -matrix BLOSUM62 -evalue 0.01 -gapopen 11 -gapextend 1 -word_size 6 -out QUERYLOC2/blastresults_outfmt0_flagella.txt -num_threads 10
wait
echo "Done with script" 
date
