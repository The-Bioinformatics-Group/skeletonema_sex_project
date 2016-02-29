#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /state/partition2/mathias_temp/stdout_BLASTx_annotation_thal0.txt
#$ -e /state/partition2/mathias_temp/stderr_BLASTx_annotation_thal0.txt
#$ -j y
#$ -S /bin/bash
wait
DBLOC1=/state/partition2/mathias_temp/references/thal_database/thalassiosira_pseudonana_proteinannotation.fasta
DBLOC2=/state/partition2/mathias_temp/references/phaeda_database/phaeodactylum_tricornutum_proteinannotation.fasta
TRANSCRIPTOME=/state/partition2/mathias_temp/skeletonema-marinoi_transcriptome_unannotated.fasta
OUTPUT=/state/partition2/mathias_temp/blastx_output
wait
blastx -query $TRANSCRIPTOME -db $DBLOC1 -outfmt 0 -num_alignments 10 -matrix BLOSUM62 -evalue 0.01 -gapopen 11 -gapextend 1 -word_size 6 -out $OUTPUT/blastresults_outfmt0_transcriptomevsthal.txt -num_threads 10
wait
echo "Done with script" 
date
