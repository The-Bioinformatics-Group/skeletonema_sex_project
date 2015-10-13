##This is the folder of the paired-end RNA-seq skeletonema data

After filtering low quality reads and removing adapters, this data will be used together with the single-end RNA-seq data to create a reference transcriptome assembly against which the single-end RNA seq reads from the RNA-sex sequencing will be mapped and expression evaluated.


Sample 1, forward reads = 1F

Sample 1, reverse reads = 1R

Sample 2, forward reads = 2F

Sample 2, reverse reads = 2R



###Adapter-trimming

The data was adapter-trimmed using a script located in:

/code/Bash-scripts/Misc-scripts/

Named: 

cutadapt_run.sh

The specific settings used:

cutadapt -b AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACATCACGATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACCGATGTATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACTTAGGCATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACTGACCAATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACGCCAATATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACCAGATCATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACACTTGAATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACGATCAGATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACTAGCTTATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACGGCTACATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACCTTGTAATCTCGTATGCCGTCTTCTGCTTG -b GATCGGAAGAGCACACGTCTGAACTCCAGTCACCGGTGTATCTCGTATGCCGTCTT
-b GATCGGAAGAGCACACGTCTGAACTCCAGTCACAGCGATAGATCTCGTAT
 
-q 15

-O 10

-e 0.1

-n 1

-m 50

-f fastq
 
-o results.txt 

--info-file=report.txt 

input-file.fastq


All report-files, including a standard output file was saved in the directory cutadapts_reports.
All result-files was saved in a directory named cutadapts_results.


###Quality-filter

The data was quality-filtered using a script located in:

/code/Bash-scripts/Misc-scripts/

Named:

fastq_quality-filter_run_pairedend.sh


The specific settings used:

Q33

-q 20

-p 95


All report-files, including a standard output file was saved in the directory fastq_quality_filter_reports.

All result-files was saved in a directory named fastq_quality_filter_results.

