#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/read-mapping_mega-assembly/stdout_bowtie.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/read-mapping_mega-assembly/stderr_bowtie.txt
#$ -j y
#$ -S /bin/bash
wait
ASSEMBLY=/nobackup/data5/skeletonema_sex_project/test/assembly-test/mega-assembly_trinity/bowtieindex
OUTPUT=/nobackup/data5/skeletonema_sex_project/test/assembly-test/read-mapping_mega-assembly/sample1_pairedend
wait
DATA=/nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results
wait
bowtie2 -a --end-to-end -x $ASSEMBLY/mega-assembly-bowtie2-ref -1 $DATA/1F_fastq-q-filt_sorted.fastq -2 $DATA/1R_fastq-q-filt_sorted.fastq -U $DATA/1F_fastq-q-filt_singletons.fastq,$DATA/1R_fastq-q-filt_singletons.fastq -S $OUTPUT/alignment.sam
wait
echo "Done with script" 
date
