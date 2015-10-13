#This is a directory containing miscellaneous scripts

###gunzip_run.sh
This script simply runs gunzip and unzips .gz files located in /data

###sed_seq-headeredit.sh
This script first creates 14 text-files named according to the 14 samples.
It then goes through each original file and exchanges the start of the header of each read (@HWI) with the name of that particular sample (i.e @CL10) and saves the changes and the data in the recently created text-files.

###join_text.sh
This script simply lists the read content of each sample file located in a specific folder and outputs it into a single file. Specifically for raw data in this case, but otherwise it is the same as join_text_rna-sex.sh

###join_text_rna-sex.sh
Same as join_text.sh only that it joins together filtered and trimmed data files. Different search-path is all.

###cutadapt_run.sh
This script runs cutadapt on all txt files in a specified folder. Specific settings used here can be changed but are set to:  

cutadapt -b AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACATCACGATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACCGATGTATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACTTAGGCATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACTGACCAATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACGCCAATATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACCAGATCATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACACTTGAATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACGATCAGATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACTAGCTTATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACGGCTACATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACCTTGTAATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACCGGTGTATCTCGTATGCCGTCTT -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACAGCGATAGATCTCGTAT  
-q 15  
-O 10  
-e 0.1  
-n 1  
-m 50  
-f fastq  
-o SEARCHPATH/adaptrim.txt --info-file=SEARCHPATH/report.txt SEARCHPATH/input.txt > SEARCHPATH/stdout_cutadapt.txt

###fastq_quality-filter_run.sh
This script runs fastq_quality_filter on all the txt files in a specified folders. Specific settings used here can be changed but are set to:

-Q33   
-q 20  
-p 95  

This specific script has a searchpath to the singleend reads. But other than that, it is identical to fastq_quality-filter_run_pairedend.sh which simply has the searchpath to the pairedend reads.

###fastq_quality-filter_run_pairedend.sh
Identical to fastq_quality_filter_run.sh with the exception of having input and output files for the pairedend reads instead of the single end reads.
