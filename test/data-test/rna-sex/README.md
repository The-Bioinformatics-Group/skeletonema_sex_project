##Folder for filtered/trimmed RNA-sex data

14 samples. Original data found in /data/rna-sex-data/

###RNA-sex_all.fq  
This file contains all data after it has first been trimmed with cutadapt, and then been filtered with fastq_quality_filter.

###Trimming the data using cutadapt  
All original raw data files were first trimmed using cutadapt.  
The script located in /code/Bash-scripts/Misc-scripts/cutadapt_run.sh  
The parameters used in this trimming were as follows:  

b: Search for adapters in -b  
q: Trim low quality ends from reads before adapter removal, set to phred 15 in this case  
O: Minimum overlap length between adapter and read. If overlap is less than O, the read is unmodified  
e: Maximum allowed error rate. Number of errors divided by length of matching region. 0.1 = 1 in 10  
n: Try to remove adapters at most COUNT times.  
m: Discard trimmed reads that are shorter than LENGTH.  
f: Format, fastq  

With following values:
b: -b AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACATCACGATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACCGATGTATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACTTAGGCATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACTGACCAATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACGCCAATATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACCAGATCATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACACTTGAATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACGATCAGATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACTAGCTTATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACGGCTACATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACCTTGTAATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACCGGTGTATCTCGTATGCCGTCTT -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACAGCGATAGATCTCGTAT  
q:15   
O:10  
e:0.1  
n:1  
m:50  
f: fastq   

After filtering using the result of this trimming step. The trimmed data was removed as it wasn't going to be used for anything. 

###Filtering the data using fastq_quality_filter  

Secondly the trimmed data was quality-filtered using fastq_quality_filter.  
The script used is located in /code/Bash-scripts/Misc-scripts/fastq_quality-filter_run.sh   
Parameter used in this filtering were as follows:   

q: Minimum quality score to keep.   
p: Minimum percent of bases that must have [-q] quality.   

With the following values:   
-Q33  
q:20   
p:95   

###Evaluating quality of filtered data using FastQC

These results can be found in fastq_quality_filter_results/FastQC-reports

