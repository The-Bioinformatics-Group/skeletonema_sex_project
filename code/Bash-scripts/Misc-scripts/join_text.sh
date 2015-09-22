#!/bin/bash
#$ -cwd
#$ -q sandbox
#$ -o stdout_join-text.txt
#$ -e stderr_join-text.txt
#$ -j y
#$ -S /bin/bash

cat /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_CL10* >> /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX-All.txt
wait
echo "CL10 finished"

cat /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_CL11* >> /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX-All.txt
wait
echo "CL11 finished"

cat /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_CL17* >> /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX-All.txt
wait
echo "CL17 finished"

cat /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_CL18* >> /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX-All.txt
wait
echo "CL18 finished"

cat /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_CS12* >> /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX-All.txt
wait
echo "CS12 finished"

cat /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_CS13* >> /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX-All.txt
wait
echo "CS13 finished"

cat /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_CS14* >> /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX-All.txt
wait
echo "CS14 finished"

cat /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_CS19* >> /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX-All.txt
wait
echo "CS19 finished"

cat /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_CS20* >> /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX-All.txt
wait
echo "CS20 finished"

cat /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_CS21* >> /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX-All.txt
wait
echo "CS21 finished"

cat /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_NoCL15* >> /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX-All.txt
wait
echo "NoCL15 finished"

cat /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_NoCL16* >> /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX-All.txt
wait
echo "NoCL16 finished"

cat /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_NoCL8* >> /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX-All.txt
wait
echo "NoCL8 finished"

cat /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_NoCL9* >> /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX-All.txt
wait
echo "NoCL9 finished"

wait
echo "Done with script"
date
