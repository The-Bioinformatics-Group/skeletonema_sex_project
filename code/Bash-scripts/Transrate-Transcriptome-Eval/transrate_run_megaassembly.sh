#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/mega-assembly/treated-assemblies/cd-hit-est-dedupe1/cd-hit-est3/transrate/stdout_transrate.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/mega-assembly/treated-assemblies/cd-hit-est-dedupe1/cd-hit-est3/transrate/stderr_transrate.txt
#$ -j y
#$ -S /bin/bash
wait
LOC_PAIR=/nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results
ASSEMBLY=mega-assembly-dedupe1cdhitest3
ASSLOC=/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/mega-assembly/treated-assemblies/cd-hit-est-dedupe1/cd-hit-est3/mega-assembly2-dedupe1cdhitest3.fasta
OUTPUT=/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/mega-assembly/treated-assemblies/cd-hit-est-dedupe1/cd-hit-est3/transrate
wait 
transrate --assembly $ASSLOC --threads 10 --left ${LOC_PAIR}/1F_fastq-q-filt_sorted.fastq,${LOC_PAIR}/2F_fastq-q-filt_sorted.fastq --right ${LOC_PAIR}/1R_fastq-q-filt_sorted.fastq,${LOC_PAIR}/2R_fastq-q-filt_sorted.fastq --output $OUTPUT
wait
echo "Done with script" 
date

