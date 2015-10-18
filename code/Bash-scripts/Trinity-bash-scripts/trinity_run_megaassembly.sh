#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/mega-assembly/stdout_trinity.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/mega-assembly/stderr_trinity.txt
#$ -j y
#$ -S /bin/bash
#$ -l free_mem=144G

wait
LOC_SINGLE=/nobackup/data5/skeletonema_sex_project/test/data-test/rna-sex
LOC_PAIR=/nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results
wait 
Trinity --bflyHeapSpaceInit 12G --bflyHeapSpaceMax 14G --seqType fq --JM 144G --left ${LOC_PAIR}/1F_fastq-q-filt.txt,${LOC_PAIR}/2F_fastq-q-filt.txt,${LOC_SINGLE}/RNA-sex_all.fq --right ${LOC_PAIR}/1R_fastq-q-filt.txt,${LOC_PAIR}/2R_fastq-q-filt.txt --CPU 12 --bflyCalculateCPU --output /nobackup/data5/skeletonema_sex_project/test/assembly-test/mega-assembly

wait
echo "Done with Trinity assembly!"
date



