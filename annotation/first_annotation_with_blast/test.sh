#!/bin/bash

THREADS=2
QUERY=test_query.fst
DB=/nobackup/data5/data/references/Heterokonts_genomes_transcriptoms_JGI/Allgenomes/Thalassiosira_pseudonana/FilteredModels_proteins_Thaps3_geneModels_FilteredModels2_aa.fasta

blastx -query $QUERY -db $DB -num_threads $THREADS -out test_2_Thalasiosira_pseudonana_refSeq.BLASTx.txt -outfmt "6 qseqid sseqid pident bitscore score length"

# cat test_2_Thalasiosira_pseudonana_refSeq.BLASTx.txt | uniq -w 30
