#$ -cwd
#$ -q high_mem
#$ -o stdout_removeunpaired2.txt
#$ -e stderr_removeunpaired2.txt
#$ -j y
#$ -S /bin/bash

wait
echo "Starting removing unpaired paired end reads perl script"
wait
/nobackup/data5/skeletonema_sex_project/code/Perl-scripts/removeunpairedreads.pl /nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results/1F_fastq-q-filt.fq /nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results/1R_fastq-q-filt.fq
wait
echo "Done with script
date
