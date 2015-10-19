#!/bin/bash
#$ -cwd
#$ -q sandbox
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/transrate-eval/eval1+2/stdout_transrate.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/transrate-eval/eval1+2/stderr_transrate.txt
#$ -j y
#$ -S /bin/bash
wait 
transrate --assembly /nobackup/data5/skeletonema_sex_project/test/assembly-test/assembly_test1/trinity_out_dir/Trinity.fasta,/nobackup/data5/skeletonema_sex_project/test/assembly-test/assembly_test2/trinity_out_dir/Trinity.fasta --output /nobackup/data5/skeletonema_sex_project/test/assembly-test/transrate-eval/eval1+2
wait
echo "Done with script" 
date
