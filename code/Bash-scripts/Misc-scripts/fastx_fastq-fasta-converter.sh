#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -e stderr_fastqfastaconvert.txt
#$ -o stdout_fastqfastaconvert.txt 
#$ -j y
#$ -S /bin/bash
wait
fastq_to_fasta -i /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/mega-assembly/treated-assemblies/cd-hit-est-dedupe1/cd-hit-est3/megaassembly_settings3.fasta -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/mega-assembly/treated-assemblies/cd-hit-est-dedupe1/cd-hit-est3/mega-assembly2-dedupe1cdhitest3.fasta
wait
echo "Done with script!"
date
