#!/bin/bash
#$ -cwd
#$ -q node0
#$ -o stdout_searchforpairs.txt
#$ -e stderr_searchforpairs.txt
#$ -j y
#$ -S /bin/bash
wait
TEMPLOC=/nobackup/data5/skeletonema_sex_project/test/temporary_files
FWDFILE=/nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results/1F_fastq-q-filt.fq
REVFILE=/nobackup/data5/skeletonema_sex_project/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results/1R_fastq-q-filt.fq
SAM=/nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly/align_and_estimate_abundance/pairedend.sam
ASSEMBLY=/nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly/Trinity.fasta
NUM=0
CONTIGTOTALNUM=0
CONTIGNUM=0
CONTIGMATCH=0
FWDREADNUM=0
REVREADNUM=0
wait
egrep -v '@|B|#|F' $FWDFILE | grep -v "+"  -m 100 | cut -b 80- > ${TEMPLOC}/100fwdreads.txt
egrep -v '@|B|#|F' $REVFILE | grep -v "+"  -m 100 | cut -b -80 > ${TEMPLOC}/100revreads.txt

wait

for i in $(seq 1 100);
do
NUM=$((NUM+1))
wait
echo "Searching for common contigs for read-pair $NUM " >> commoncontigs.txt
FORWARD=$(sed "${NUM}q;d" ${TEMPLOC}/100fwdreads.txt)
REVERSE=$(sed "${NUM}q;d" ${TEMPLOC}/100revreads.txt)
wait
grep -e"$FORWARD" $SAM | grep -e"c" > $TEMPLOC/listofcontiginfofwd.txt
wait
grep -e"$REVERSE" $SAM | grep -e"c" > $TEMPLOC/listofcontiginforev.txt
wait
cut -d$'\t' -f3 $TEMPLOC/listofcontiginfofwd.txt > $TEMPLOC/listofcontigsfwd.txt
cut -d$'\t' -f3 $TEMPLOC/listofcontiginforev.txt > $TEMPLOC/listofcontigsrev.txt
wait
CONTIGTOTALNUM=$(wc ${TEMPLOC}/listofcontigsfwd.txt | cut -d" " -f2)
wait
echo "Forward read: $NUM exist in total number of contigs (may be duplicated) : $CONTIGTOTALNUM " >> commoncontigs.txt

for i in $(seq 1 ${CONTIGTOTALNUM});
do
CONTIGNUM=$((CONTIGNUM+1))
wait
CONTIG=$(sed "${CONTIGNUM}q;d" ${TEMPLOC}/listofcontigsfwd.txt)
wait
if [ "${CONTIG}" != "${CONTIGMATCH}" ]; then
	CONTIGMATCH=$(grep -e "${CONTIG}" ${TEMPLOC}/listofcontigsrev.txt)
	wait
	if [ "${CONTIG}" == "${CONTIGMATCH}" ]; then
		echo "Contig: $CONTIGMATCH exists in both forward and reverse read $NUM " >> commoncontigs.txt
		CONTIGLENGTH=$(grep -e "${CONTIGMATCH}" ${ASSEMBLY} | cut -d"=" -f2 | egrep -v 'G|A|T|C' | cut -d" " -f1)
		wait
		echo "Contig length = $CONTIGLENGTH " >> commoncontigs.txt
		wait
		grep -e "${CONTIGMATCH}" $TEMPLOC/listofcontiginfofwd.txt | cut -d$'\t' -f4 > ${TEMPLOC}/fwdreadpos.txt
		wait
		grep -e "${CONTIGMATCH}" $TEMPLOC/listofcontiginforev.txt | cut -d$'\t' -f4 > ${TEMPLOC}/revreadpos.txt 
		wait
		TOTALFWDREADS=$(wc ${TEMPLOC}/fwdreadpos.txt | cut -d" " -f2)
		wait
		TOTALREVREADS=$(wc ${TEMPLOC}/revreadpos.txt | cut -d" " -f2)
		wait
		for i in $(seq 1 ${TOTALFWDREADS});
		do
		FWDREADNUM=$((FWDREADNUM+1))
		wait
		FWDREADPOS=$(sed "${FWDREADNUM}q;d" ${TEMPLOC}/fwdreadpos.txt)
		for i in $(seq 1 ${TOTALREVREADS});
		do
		REVREADNUM=$((REVREADNUM+1))
		wait
		REVREADPOS=$(sed "${REVREADNUM}q;d" ${TEMPLOC}/revreadpos.txt)
		wait
		FRAGMENTLENGTH=$((${REVREADPOS} + 151 - ${FWDREADPOS}))
		echo "bp length between forward read $FWDREADNUM and reverse read $REVREADNUM :" >> commoncontigs.txt
		wait
		echo "${FRAGMENTLENGTH}" >> commoncontigs.txt
		done
		done
	fi
fi
done
wait
done
rm $TEMPLOC/fwdreadpos*
rm $TEMPLOC/revreadpos*
rm $TEMPLOC/listofcont*
rm $TEMPLOC/10000fwdreads.txt
rm $TEMPLOC/10000revreads.txt
echo "Done with script" 
date

