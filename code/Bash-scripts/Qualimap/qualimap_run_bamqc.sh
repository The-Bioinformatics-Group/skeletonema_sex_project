#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o stdout_qualimap.txt
#$ -e stderr_qualimap.txt
#$ -j y
#$ -S /bin/bash
wait
/home/mathias/qualimap_v2.1.3/qualimap bamqc -bam /nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly/align_and_estimate_abundance/bowtime.csorted.bam -outdir /nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly/align_and_estimate_abundance/qualimap_results
wait
echo "Done with script" 
date

