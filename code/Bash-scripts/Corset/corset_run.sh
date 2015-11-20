#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/mega-assembly_corset/stdout_corset.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/mega-assembly_corset/stderr_corset.txt
#$ -j y
#$ -S /bin/bash
wait
SOFTWARE=/nobackup/data5/skeletonema_sex_project/software/corset/Corset-version-1.04/corset
ASSEMBLY=/nobackup/data5/skeletonema_sex_project/test/assembly-test/singleend+pairedend-trinity.fasta
OUTPUT=/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly4
BAMFILES=/nobackup/data5/skeletonema_sex_project/test/assembly-test/read-mapping_mega-assembly
S=alignment.sam
P=alignment_fast.sam
wait
$SOFTWARE -g CL2-17BI,CL2-17BI,CL3-17BI,CL3-17BI,CS2-17AS,CS2-17CS,CS2-17DS,CS3-17AS,CS3-17CS,CS3-17DS,NCL3-17BI,NCL3-17BI,NCL2-17BI,NCL2-17BI,pairedreads1,pairedreads2 -n CL2-17BI-REP1,CL2-17BI-REP2,CL3-17BI-REP1,CL3-17BI-REP2,CS2-17AS,CS2-17CS,CS2-17DS,CS3-17AS,CS3-17CS,CS3-17DS,NCL3-17BI-REP1,NCL3-17BI-REP2,NCL2-17BI-REP1,NCL2-17BI-REP2,pairedreads1,pairedreads2  -p corset_mega-assembly $BAMFILES/sample1/$S $BAMFILES/sample2/$S $BAMFILES/sample3/$S $BAMFILES/sample4/$S $BAMFILES/sample5/$S $BAMFILES/sample6/$S $BAMFILES/sample7/$S $BAMFILES/sample8/$S $BAMFILES/sample9/$S $BAMFILES/sample10/$S $BAMFILES/sample11/$S $BAMFILES/sample12/$S $BAMFILES/sample13/$S $BAMFILES/sample14/$S $BAMFILES/sample1_pairedend/$P $BAMFILES/sample2_pairedend/$P
wait
echo "Done with script" 
date
