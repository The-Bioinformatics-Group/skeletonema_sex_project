#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /state/partition2/mathias_temp/stdout_BLASTx_annotation_thal7.txt
#$ -e /state/partition2/mathias_temp/stderr_BLASTx_annotation_thal7.txt
#$ -j y
#$ -S /bin/bash
wait
DBLOC1=/state/partition2/mathias_temp/references/thal_database/thalassiosira_pseudonana_proteinannotation.fasta
DBLOC2=/state/partition2/mathias_temp/references/phaeda_database/phaeodactylum_tricornutum_proteinannotation.fasta
TRANSCRIPTOME=/state/partition2/mathias_temp
OUTPUT=/state/partition2/mathias_temp/blastx_output
wait
blastx -query $TRANSCRIPTOME/skeletonema-marinoi_transcriptome_unannotated_part1.fasta -db $DBLOC1 -outfmt 7 -max_target_seqs 5 -matrix BLOSUM62 -evalue 0.01 -gapopen 11 -gapextend 1 -word_size 6 -out $OUTPUT/blastresults_outfmt7_transcriptomevsthal_part1.txt -num_threads 8
wait
blastx -query $TRANSCRIPTOME/skeletonema-marinoi_transcriptome_unannotated_part2.fasta -db $DBLOC1 -outfmt 7 -max_target_seqs 5 -matrix BLOSUM62 -evalue 0.01 -gapopen 11 -gapextend 1 -word_size 6 -out $OUTPUT/blastresults_outfmt7_transcriptomevsthal_part2.txt -num_threads 8
wait
blastx -query $TRANSCRIPTOME/skeletonema-marinoi_transcriptome_unannotated_part3.fasta -db $DBLOC1 -outfmt 7 -max_target_seqs 5 -matrix BLOSUM62 -evalue 0.01 -gapopen 11 -gapextend 1 -word_size 6 -out $OUTPUT/blastresults_outfmt7_transcriptomevsthal_part3.txt -num_threads 8
wait
blastx -query $TRANSCRIPTOME/skeletonema-marinoi_transcriptome_unannotated_part4.fasta -db $DBLOC1 -outfmt 7 -max_target_seqs 5 -matrix BLOSUM62 -evalue 0.01 -gapopen 11 -gapextend 1 -word_size 6 -out $OUTPUT/blastresults_outfmt7_transcriptomevsthal_part4.txt -num_threads 8
wait
echo "Done with script" 
date
