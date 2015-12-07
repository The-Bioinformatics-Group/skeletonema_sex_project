#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/4/transrate/3merged_settings4/bowtie_aligned/corset_output/stdout_corset.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/4/transrate/3merged_settings4/bowtie_aligned/corset_output/stderr_corset.txt
#$ -j y
#$ -S /bin/bash
wait
SOFTWARE=/nobackup/data5/skeletonema_sex_project/software/corset/Corset-version-1.04/corset
ASSEMBLY=/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/4/transrate/3merged_settings4/transrate-good+rsem-good.fasta
OUTPUT=/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/4/transrate/3merged_settings4/bowtie_aligned/corset_output
BAMFILES=/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/4/transrate/3merged_settings4/bowtie_aligned
S=alignment.sam
P=alignment.sam
wait
$SOFTWARE -g CL2-17Bl,CL2-17Bl,CL3-17Bl,CL3-17Bl,CS2,CS2,CS2,CS3,CS3,CS3,NCL3-17Bl,NCL3-17Bl,NCL2-17Bl,NCL2-17Bl,P1,P2 -n CL2-17BI-REP1,CL2-17BI-REP2,CL3-17BI-REP1,CL3-17BI-REP2,CS2-17AS,CS2-17CS,CS2-17DS,CS3-17AS,CS3-17CS,CS3-17DS,NCL3-17BI-REP1,NCL3-17BI-REP2,NCL2-17BI-REP1,NCL2-17BI-REP2,pairedreads1,pairedreads2  -p corset_clusteredcontigs $BAMFILES/sample1/$S $BAMFILES/sample2/$S $BAMFILES/sample3/$S $BAMFILES/sample4/$S $BAMFILES/sample5/$S $BAMFILES/sample6/$S $BAMFILES/sample7/$S $BAMFILES/sample8/$S $BAMFILES/sample9/$S $BAMFILES/sample10/$S $BAMFILES/sample11/$S $BAMFILES/sample12/$S $BAMFILES/sample13/$S $BAMFILES/sample14/$S $BAMFILES/sample1_p/$P $BAMFILES/sample2_p/$P
wait
echo "Done with script" 
date
