#$ -cwd
#$ -q high_mem
#$ -o stdout_mapping_filtering.txt
#$ -e stderr_mapping_filtering.txt
#$ -j y
#$ -S /bin/bash
wait
ASSEMBLY=/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/4/transrate/3merged_settings4/good.3merged_settings4.fasta
DATA=/nobackup/data5/skeletonema_sex_project/test/data-test/rna-sex/RNA-sex_all.fq
SOFTWARE=/nobackup/data5/skeletonema_sex_project/code/Bash-scripts/Misc-scripts/mapping_filtering.sh
wait
$SOFTWARE -d $ASSEMBLY -u $DATA -n search-uniquetranscripts -t 10
wait
echo "Done with script
date
