#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /home/mathias/detonate-1.10/rsem-eval/true_transcript_length_distribution/stdout_transceval3.txt
#$ -e /home/mathias/detonate-1.10/rsem-eval/true_transcript_length_distribution/stderr_transceval3.txt
#$ -j y
#$ -S /bin/bash
wait
SOFTWARE=/home/mathias/detonate-1.10/rsem-eval/rsem-eval-estimate-transcript-length-distribution
PARFILELOC=/home/mathias/detonate-1.10/rsem-eval/true_transcript_length_distribution
TRANSCRIPTOME=/nobackup/data5/data/references/Heterokonts_genomes_transcriptoms_JGI/Allgenomes/Thalassiosira_pseudonana/FilteredModels_transcripts_Thaps3_geneModels_FilteredModels2_nt.fasta
wait 
$SOFTWARE $TRANSCRIPTOME $PARFILELOC/thalassiosira_psuedonana_filtmodelthaps3genemodels2.txt
wait
echo "Done with script" 
date

