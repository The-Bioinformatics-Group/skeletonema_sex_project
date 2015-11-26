#!/bin/bash
#$ -cwd
#$ -q node0
#$ -o stdout_searchforpairs2.txt
#$ -e stderr_searchforpairs2.txt
#$ -j y
#$ -S /bin/bash
wait
TEMPLOC=/nobackup/data5/skeletonema_sex_project/test/temporary_files
FWDFILE=/nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results/1F_fastq-q-filt_sorted.fastq
REVFILE=/nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results/1R_fastq-q-filt_sorted.fastq
SAM=/nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly/align_and_estimate_abundance/pairedend.sam
ASSEMBLY=/nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly/Trinity.fasta
READNUM=0
READMATCH=0
wait
more +9000 -1000 $FWDFILE |grep -e "@" -m 100 | cut -d " " -f1 | cut -d "@" -f2 > ${TEMPLOC}/100reads.txt
for i in $(seq 1 100);
do
READNUM=$(($READNUM + 1))
wait
echo "Looking for read pair number: $READNUM aligned to contigs in SAM file" >> found.txt
READ=$(sed "${READNUM}q;d" ${TEMPLOC}/100reads.txt) 
wait
grep -e "${READ}" $SAM | grep -e "c" > ${TEMPLOC}/contigalignedread.txt
wait
cat ${TEMPLOC}/contigalignedread.txt >> found.txt
done
wait
rm ${TEMPLOC}/100*
rm ${TEMPLOC}/contigaligned*
wait
echo "Done with script" 
date

