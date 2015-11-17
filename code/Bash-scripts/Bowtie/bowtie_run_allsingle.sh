#!/bin/bash
#$ -cwd
#$ -q node0
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/read-mapping_mega-assembly/stdout_bowtie_single.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/read-mapping_mega-assembly/stderr_bowtie_single.txt
#$ -j y
#$ -S /bin/bash
wait
ASSEMBLY=/nobackup/data5/skeletonema_sex_project/test/assembly-test/mega-assembly_trinity/bowtieindex
OUTPUT=/nobackup/data5/skeletonema_sex_project/test/assembly-test/read-mapping_mega-assembly
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
echo "Mapping reads from $RNAFILE to mega-assembly"
OUTPUTSPEC=$DATA/$RNAFILE
wait
touch $OUTPUT/sample${NUM}/alignment.sam
wait
bowtie2 -a --end-to-end -x $ASSEMBLY/mega-assembly-bowtie2-ref -U $OUTPUTSPEC -S $OUTPUT/sample${NUM}/alignment.sam
wait
done
wait
rm $TEMP
echo "Done with script" 
date
