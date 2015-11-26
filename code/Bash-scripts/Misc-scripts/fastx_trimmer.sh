#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -e stderr_fastxtrim.txt
#$ -o stdout_fastxtrim.txt 
#$ -j y
#$ -S /bin/bash
DIR=/nobackup/data5/skeletonema_sex_project/test/data-test/rna-sex/fastq_quality_filter_results
wait
fastx_trimmer -Q33 -f 14 -i $DIR/CL10_fastq-q-filt.fq -o $DIR/CL10_trim14test.fq
wait
fastx_trimmer -Q33 -f 14 -i $DIR/CL11_fastq-q-filt.fq -o $DIR/CL11_trim14test.fq
wait
fastx_trimmer -Q33 -f 14 -i $DIR/CL17_fastq-q-filt.fq -o $DIR/CL17_trim14test.fq
wait
echo "Done with script!"
date
