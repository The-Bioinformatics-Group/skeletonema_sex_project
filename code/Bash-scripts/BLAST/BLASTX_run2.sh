#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/differential-expression-analysis/blast_searches/stdout_BLASTX_againstuniprot.txt
#$ -e /nobackup/data5/skeletonema_sex_project/differential-expression-analysis/blast_searches/stderr_BLASTX_againstuniprot.txt
#$ -j y
#$ -S /bin/bash
wait
ANALYSISLOC1=/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/blast_searches/58athal+scere-meiosisgenes
ANALYSISLOC2=/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/blast_searches/flagellagenes/uniprot_results
wait
blastx -db uniprot -query ${ANALYSISLOC1}/58meiosisgenes_contighits.fasta -evalue 0.01 -max_target_seqs 5 -word_size 6 -gapopen 11 -gapextend 1 -outfmt 7 -show_gis -remote -matrix BLOSUM62 -out $ANALYSISLOC1/uniprot_results_outfmt7_meiosisgenes.txt
wait
blastx -db uniprot -query ${ANALYSISLOC1}/58meiosisgenes_contighits.fasta -evalue 0.01 -num_alignments 5 -word_size 6 -gapopen 11 -gapextend 1 -outfmt 0 -show_gis -remote -matrix BLOSUM62 -out $ANALYSISLOC1/uniprot_results_outfmt0_meiosisgenes.txt
wait
blastx -db uniprot -query ${ANALYSISLOC2}/flagellagenes_contighits.fasta -evalue 0.01 -max_target_seqs 5 -word_size 6 -gapopen 11 -gapextend 1 -outfmt 7 -show_gis -remote -matrix BLOSUM62 -out $ANALYSISLOC2/uniprot_results_outfmt7_flagellagenes.txt
wait
blastx -db uniprot -query ${ANALYSISLOC2}/flagellagenes_contighits.fasta -evalue 0.01 -num_alignments 5 -word_size 6 -gapopen 11 -gapextend 1 -outfmt 0 -show_gis -remote -matrix BLOSUM62 -out $ANALYSISLOC2/uniprot_results_outfmt0_flagellagenes.txt
wait
echo "Done with script" 
date
