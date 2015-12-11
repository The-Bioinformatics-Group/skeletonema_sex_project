#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/differential-expression-analysis/bowtie2-read-mapping/mapping2/stdout_bowtie.txt
#$ -e /nobackup/data5/skeletonema_sex_project/differential-expression-analysis/bowtie2-read-mapping/mapping2/stderr_bowtie.txt
#$ -j y
#$ -S /bin/bash
wait
ASSEMBLY=/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/bowtie2-read-mapping/transcriptome-bowtie2index
OUTPUT=/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/bowtie2-read-mapping/mapping2
DATA=/nobackup/data5/skeletonema_sex_project/test/data-test/rna-sex/fastq_quality_filter_results
TEMP=/nobackup/data5/skeletonema_sex_project/test/temporary_files/rnasex-bowtie.txt
NUM=0
wait
ls $DATA | grep -e "fq" > $TEMP
wait
NUMFILES=$(wc $TEMP | cut -d" " -f2)
wait
echo "There are $NUMFILES files to be mapped in the specified directory"
wait
for i in $(seq 1 $NUMFILES);
do
NUM=$((NUM+1))
wait
RNAFILE=$(sed "${NUM}q;d" $TEMP)
wait
echo "Mapping reads from $RNAFILE to s-marinoi transcriptome"
OUTPUTSPEC=$DATA/$RNAFILE
wait
mkdir $OUTPUT/sample${NUM}
wait
touch $OUTPUT/sample${NUM}/alignment.sam
wait
bowtie2 --end-to-end --threads 20 -x $ASSEMBLY/s-marinoi_bowtie2_transcriptomeindex -U $OUTPUTSPEC -S $OUTPUT/sample${NUM}/alignment.sam
wait
done
wait
rm $TEMP
echo "Done with script" 
date
