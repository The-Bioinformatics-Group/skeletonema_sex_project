#!/bin/bash
#$ -cwd
#$ -q sandbox
#$ -o stdout_sed.txt
#$ -e stderr_sed.txt
#$ -j y
#$ -S /bin/bash

wait
touch /nobackup/data5/skeletonema_sex_project/data/CL10.txt
touch /nobackup/data5/skeletonema_sex_project/data/CL11.txt
touch /nobackup/data5/skeletonema_sex_project/data/CL17.txt
touch /nobackup/data5/skeletonema_sex_project/data/CL18.txt
touch /nobackup/data5/skeletonema_sex_project/data/CS12.txt
touch /nobackup/data5/skeletonema_sex_project/data/CS13.txt
touch /nobackup/data5/skeletonema_sex_project/data/CS14.txt
touch /nobackup/data5/skeletonema_sex_project/data/CS19.txt
touch /nobackup/data5/skeletonema_sex_project/data/CS20.txt
touch /nobackup/data5/skeletonema_sex_project/data/CS21.txt
touch /nobackup/data5/skeletonema_sex_project/data/NoCL15.txt
touch /nobackup/data5/skeletonema_sex_project/data/NoCL16.txt
touch /nobackup/data5/skeletonema_sex_project/data/NoCL8.txt
touch /nobackup/data5/skeletonema_sex_project/data/NoCL9.txt


wait
sed 's/@HWI/@CL10/' /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_CL10* > /nobackup/data5/skeletonema_sex_project/data/CL10.txt
wait
echo "Header replaced in CL10" 
sed 's/@HWI/@CL11/' /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_CL11* > /nobackup/data5/skeletonema_sex_project/data/CL11.txt
wait
echo "Header replaced in CL11" 
sed 's/@HWI/@CL17/' /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_CL17* > /nobackup/data5/skeletonema_sex_project/data/CL17.txt
wait
echo "Header replaced in CL17" 
sed 's/@HWI/@CL18/' /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_CL18* > /nobackup/data5/skeletonema_sex_project/data/CL18.txt
wait
echo "Header replaced in CL18" 
sed 's/@HWI/@CS12/' /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_CS12* > /nobackup/data5/skeletonema_sex_project/data/CS12.txt
wait
echo "Header replaced in CS12" 
sed 's/@HWI/@CS13/' /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_CS13* > /nobackup/data5/skeletonema_sex_project/data/CS13.txt
wait
echo "Header replaced in CS13" 
sed 's/@HWI/@CS14/' /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_CS14* > /nobackup/data5/skeletonema_sex_project/data/CS14.txt
wait
echo "Header replaced in CS14" 
sed 's/@HWI/@CS19/' /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_CS19* > /nobackup/data5/skeletonema_sex_project/data/CS19.txt
wait
echo "Header replaced in CS19" 
sed 's/@HWI/@CS20/' /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_CS20* > /nobackup/data5/skeletonema_sex_project/data/CS20.txt
wait
echo "Header replaced in CS20" 
sed 's/@HWI/@CS21/' /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_CS21* > /nobackup/data5/skeletonema_sex_project/data/CS21.txt
wait
echo "Header replaced in CS21" 
sed 's/@HWI/@NoCL15/' /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_NoCL15* > /nobackup/data5/skeletonema_sex_project/data/NoCL15.txt
wait
echo "Header replaced in NoCL15" 
sed 's/@HWI/@NoCL16/' /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_NoCL16* > /nobackup/data5/skeletonema_sex_project/data/NoCL16.txt
wait
echo "Header replaced in NoCL16" 
sed 's/@HWI/@NoCL8/' /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_NoCL8* > /nobackup/data5/skeletonema_sex_project/data/NoCL8.txt
wait
echo "Header replaced in NoCL8" 
sed 's/@HWI/@NoCL9/' /nobackup/data5/skeletonema_sex_project/data/C6D2PACXX_NoCL9* > /nobackup/data5/skeletonema_sex_project/data/NoCL9.txt
wait
echo "Header replaced in NoCL9" 
echo "Done with script"
date
