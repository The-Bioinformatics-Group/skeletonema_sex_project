#!/bin/bash
#$ -cwd
#$ -q sandbox
#$ -o stdout_gunzip.txt
#$ -e stderr_gunzip.txt
#$ -j y
#$ -S /bin/bash

echo "Unzipping 1_131004_AH72EEADXX_P705_101F_dual93_1.fastq.gz and 1_131004_AH72EEADXX_P705_101F_dual93_2.fastq.gz" 
wait
gunzip /nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/1*
wait
echo "Finished unzipping first files. Now unzipping 2_131004_AH72EEADXX_P705_101F_dual93_2.fastq.gz and
2_131004_AH72EEADXX_P705_101F_dual93_1.fastq.gz"
gunzip /nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/2*
wait
echo "Done with script" 
date


