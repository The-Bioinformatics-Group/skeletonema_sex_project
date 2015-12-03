#!/bin/bash
#$ -cwd
#$ -q high_mem
#$ -o /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/4/transrate/3merged_settings4/bowtie_aligned/stdout_bowtie_single.txt
#$ -e /nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/4/transrate/3merged_settings4/bowtie_aligned/stderr_bowtie_single.txt
#$ -j y
#$ -S /bin/bash
wait
ASSEMBLY=/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/4/transrate/3merged_settings4/bowtie_aligned/transrate-good+rsem-good_index
OUTPUT=/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/4/transrate/3merged_settings4/bowtie_aligned
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
bowtie2 -a --end-to-end --threads 20 -x $ASSEMBLY/3mergedcdhitest4transdetofiltered-index -U $OUTPUTSPEC -S $OUTPUT/sample${NUM}/alignment.sam
wait
done
wait
rm $TEMP
echo "Done with script" 
date
