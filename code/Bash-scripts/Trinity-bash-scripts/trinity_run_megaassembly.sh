#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/mega-assembly_trinity/stdout_trinity.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/mega-assembly_trinity/stderr_trinity.txt
#$ -j y
#$ -S /bin/bash
#$ -l mem_free=130G

wait
LOC_SINGLE=/nobackup/data5/skeletonema_sex_project/test/data-test/rna-sex
LOC_PAIR=/nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results
wait 
Trinity --bflyHeapSpaceInit 10G --bflyHeapSpaceMax 12G --seqType fq --max_memory 130G --left ${LOC_PAIR}/1F_fastq-q-filt.txt,${LOC_PAIR}/2F_fastq-q-filt.txt,${LOC_SINGLE}/RNA-sex_all.fq --right ${LOC_PAIR}/1R_fastq-q-filt.txt,${LOC_PAIR}/2R_fastq-q-filt.txt --CPU 13 --bflyCalculateCPU --output /nobackup/data5/skeletonema_sex_project/test/assembly-test/mega-assembly_trinity --normalize_max_read_cov 40

wait
echo "Done with Trinity assembly!"
date



