#!/bin/bash
#$ -cwd
#$ -q node0
#$ -o /nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcript-abundance-est/RSEM_1/stdout_trin_RSEM.txt
#$ -e /nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcript-abundance-est/RSEM_1/stderr_trin_RSEM.txt
#$ -j y
#$ -S /bin/bash
wait 
SOFTWARE=/usr/local/bin/trinityrnaseq_r20140717/util/align_and_estimate_abundance.pl
OUTPUT=/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcript-abundance-est/RSEM_1
ASSEMBLY=/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/skeletonema-marinoi_transcriptome_unannotated.fasta
DATA=/nobackup/data5/skeletonema_sex_project/test/data-test/rna-sex/fastq_quality_filter_results
NUM=0
TEMP=/nobackup/data5/skeletonema_sex_project/test/temporary_files/listofrnaseqfiles.txt
wait
ls $DATA | grep -e "fq" > $TEMP
wait
for i in $(seq 1 14);
do
NUM=$((NUM+1))
wait
RNAFILE=$(sed "${NUM}q;d" ${TEMP})
wait
$SOFTWARE --single $DATA/$RNAFILE --seqType fq --transcripts $ASSEMBLY --est_method RSEM --aln_method bowtie2 --output_dir $OUTPUT --thread_count 20 --fragment_length 51 --include_rsem_bam --prep_reference
wait
done
wait
rm $TEMP
wait
echo "Done with script" 
date

