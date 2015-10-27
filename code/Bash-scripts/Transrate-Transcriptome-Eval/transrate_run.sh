#!/bin/bash
#$ -cwd
#$ -q sandbox
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/transrate-eval/mega_assembly/stdout_transrate.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/transrate-eval/mega_assembly/stderr_transrate.txt
#$ -j y
#$ -S /bin/bash
wait 
transrate --assembly /nobackup/data5/skeletonema_sex_project/test/assembly-test/mega-assembly_trinity/Trinity.fasta --output /nobackup/data5/skeletonema_sex_project/test/assembly-test/transrate-eval/mega_assembly/
wait
echo "Done with script" 
date
