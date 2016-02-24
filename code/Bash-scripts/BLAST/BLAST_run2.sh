#!/bin/bash
#$ -cwd
#$ -q node0
#$ -o /state/partition6/mathias_temp/stdout_BLASTx_annotation.txt
#$ -e /state/partition6/mathias_temp/stderr_BLASTx_annotation.txt
#$ -j y
#$ -S /bin/bash
wait
DBLOC1=/state/partition6/mathias_temp/references/thal_database/thalassiosira_pseudonana_proteinannotation.fasta
DBLOC2=/state/partition6/mathias_temp/references/phaeda_database/phaeodactylum_tricornutum_proteinannotation.fasta
TRANSCRIPTOME=/state/partition6/mathias_temp/skeletonema-marinoi_transcriptome_unannotated.fasta
OUTPUT=/state/partition6/mathias_temp/blastx_output
wait
blastx -query $TRANSCRIPTOME -db $DBLOC1 -outfmt 7 -max_target_seqs 5 -matrix BLOSUM62 -evalue 0.01 -gapopen 11 -gapextend 1 -word_size 6 -out $OUTPUT/blastresults_outfmt7_transcriptomevsthal.txt -num_threads 40 
wait
blastx -query $TRANSCRIPTOME -db $DBLOC1 -outfmt 0 -num_alignments 10 -matrix BLOSUM62 -evalue 0.01 -gapopen 11 -gapextend 1 -word_size 6 -out $OUTPUT/blastresults_outfmt0_transcriptomevsthal.txt -num_threads 40
wait
blastx -query $TRANSCRIPTOME -db $DBLOC2 -outfmt 7 -max_target_seqs 5 -matrix BLOSUM62 -evalue 0.01 -gapopen 11 -gapextend 1 -word_size 6 -out $OUTPUT/blastresults_outfmt7_transcriptomevsphaeoda.txt -num_threads 40 
wait
blastx -query $TRANSCRIPTOME -db $DBLOC2 -outfmt 0 -num_alignments 10 -matrix BLOSUM62 -evalue 0.01 -gapopen 11 -gapextend 1 -word_size 6 -out $OUTPUT/blastresults_outfmt0_transcriptomevsphaeoda.txt -num_threads 40
wait
echo "Done with script" 
date
