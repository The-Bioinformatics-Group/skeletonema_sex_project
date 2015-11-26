#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -e /nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results/stderr_joindata.txt
#$ -o /nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results/stdout_joindata.txt
#$ -j y
#$ -S /bin/bash
wait
DATALOC=/nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results
wait
echo "Starting join-data script"
wait
echo $DATALOC
cat $DATALOC/1F_fastq-q-filt_sorted.fastq >> $DATALOC/1F_sorted+singletons.fq
wait
echo "2"
cat $DATALOC/1F_fastq-q-filt_singletons.fastq >> $DATALOC/1F_sorted+singletons.fq
wait
echo "3"
cat $DATALOC/2F_fastq-q-filt_sorted.fastq >> $DATALOC/2F_sorted+singletons.fq
wait
cat $DATALOC/2F_fastq-q-filt_singletons.fastq >> $DATALOC/2F_sorted+singletons.fq
wait
echo "5"
cat $DATALOC/1R_fastq-q-filt_sorted.fastq >> $DATALOC/1R_sorted+singletons.fq
wait
cat $DATALOC/1R_fastq-q-filt_singletons.fastq >> $DATALOC/1R_sorted+singletons.fq
wait
cat $DATALOC/2R_fastq-q-filt_sorted.fastq >> $DATALOC/2R_sorted+singletons.fq
wait
echo "last one"
cat $DATALOC/2R_fastq-q-filt_singletons.fastq >> $DATALOC/2R_sorted+singletons.fq
wait
echo "Done with script!"
date
