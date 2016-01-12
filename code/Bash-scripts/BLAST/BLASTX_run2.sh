#!/bin/bash
#$ -cwd
#$ -q node0
#$ -o /nobackup/data5/skeletonema_sex_project/differential-expression-analysis/blast_searches/59athal+scere-meiosisgenes/uniprot-results/stdout_BLASTX2.txt
#$ -e /nobackup/data5/skeletonema_sex_project/differential-expression-analysis/blast_searches/59athal+scere-meiosisgenes/uniprot-results/stderr_BLASTX2.txt
#$ -j y
#$ -S /bin/bash
wait
ANALYSISLOC=/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/blast_searches/59athal+scere-meiosisgenes/uniprot-results
wait
blastx -db swissprot -query ${ANALYSISLOC}/contigsforreciprocblast.txt -evalue 0.01 -max_target_seqs 5 -word_size 6 -gapopen 11 -gapextend 1 -outfmt 7 -show_gis -remote -matrix BLOSUM62 -out $ANALYSISLOC/uniprot_results_outfmt7.txt
wait
echo "Done with script" 
date
