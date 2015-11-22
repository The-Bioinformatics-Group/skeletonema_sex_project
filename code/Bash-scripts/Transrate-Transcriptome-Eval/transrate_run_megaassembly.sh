#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/transrate-eval/mega_assembly/stdout_transrate_readmapp
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/transrate-eval/mega_assembly/stderr_transrate_readmapp
#$ -j y
#$ -S /bin/bash
wait
LOC_PAIR=/nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results
ASSEMBLY=mega-assembly-original
ASSLOC=/nobackup/data5/skeletonema_sex_project/test/assembly-test/mega-assembly_trinity/Trinity.fasta
DATA=/nobackup/data5/skeletonema_sex_project/test/data-test/rna-sex/RNA-sex_all.fq
OUTPUT=/nobackup/data5/skeletonema_sex_project/test/assembly-test/transrate-eval/mega_assembly
OUTPUTY=${OUTPUT}${ASSEMBLY}
wait 
transrate --assembly $ASSLOC --threads 20 --left ${LOC_PAIR}/1F_fastq-q-filt_sorted.fastq,${LOC_PAIR}/2F_fastq-q-filt_sorted.fastq --right ${LOC_PAIR}/1R_fastq-q-filt_sorted.fastq,${LOC_PAIR}/2R_fastq-q-filt_sorted.fastq --output $OUTPUT
wait
echo "Done with script" 
date

