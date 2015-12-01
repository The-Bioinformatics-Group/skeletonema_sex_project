#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /home/mathias/detonate-1.10/rsem-eval/true_transcript_length_distribution/stdout_transceval2.txt
#$ -e /home/mathias/detonate-1.10/rsem-eval/true_transcript_length_distribution/stderr_transceval2.txt
#$ -j y
#$ -S /bin/bash
wait
SOFTWARE=/home/mathias/detonate-1.10/rsem-eval/rsem-eval-estimate-transcript-length-distribution
PARFILELOC=/home/mathias/detonate-1.10/rsem-eval/true_transcript_length_distribution
TRANSCRIPTOME=/nobackup/data5/data/references/Heterokonts_genomes_transcriptoms_JGI/transcriptoms/Thalassiosira_rotula_conditionsforcounting/de_novo_assembly/Thalassiosira_rotula_final_contigs.fa
wait 
$SOFTWARE $TRANSCRIPTOME $PARFILELOC/thalassiosira_rotula_conditionsforcounting_denovo_final.txt
wait
echo "Done with script" 
date

