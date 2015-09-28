#!/bin/bash
#$ -cwd
#$ -q sandbox
#$ -o stdout_gunzip.txt
#$ -e stderr_gunzip.txt
#$ -j y
#$ -S /bin/bash

gunzip /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_*gz

wait
echo "Done with script" 
date


