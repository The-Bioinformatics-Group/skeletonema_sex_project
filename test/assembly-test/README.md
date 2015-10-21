##This is the test-folder for assemblies

In this folder different assemblies produced using different settings will be saved and compared to discover the optimal settings to create the reference transcriptome.

##test_assembly 1

###Purpose:

This assembly was created with the foreknowledge of the low likelihood that this will be the final assembly. The data has not been trimmed or filtered in any way and no extra functions such as k-mer normalization was used in the assembly. This assembly was made to have a point of reference, and because I wasn't sure if these other steps were necessary in the first place, and because I honestly just wanted to see if I could get Trinity to work.

###Method 1: (*FAILED*)

Data used:

Untouched raw data:   
C6D2PACXX-All.txt (name has been changed since to RNA-sex_all_raw.txt)  
Located on state/partition2 	high_mem node (this has been removed since then, but can be found on /data/rna-sex-data)  

Trinity settings:  
Trinity --seqType fq --JM 20G --single /state/partition2/mathias/C6D2PACXX-All.txt
 --CPU 6 --output /nobackup/data5/skeletonema_sex_project/data/trinity_assembly  

Sent to queue-system with:  
qsub -pe mpich 4 trinity_run.sh  

_should have used 6 instead of 4 CPUs - inconsistent_  

###Results:

Concerns during the Trinity run: Very slow run, should probably use more memory for next one.  

This assembly failed with the error message:  
Could not reserve enough space for object heap
succeeded(19314), failed(3)   88.2256% completed.    Error occurred during initialization of VM

The reason for this was that the butterfly stage of Trinity did not have enough RAM. So to make sure that this did not happen again I decided to allocate much more memory to Trinity in the next assembly. Not in the JM command, that is only for the first step of Trinity where jellyfish creates a kmer hashtable. It does not require more memory.  

###Method 2:

Used same data and the same settings.    

Used the script located in:  
/code/Bash-scripts/Trinity-bash-scripts/trinity_run.sh  

Called the script with the command:  
qsub -pe mpich 6 trinity_run.sh  

###Results 2:

This assembly finished in roughly 19 hours.

###Transcript abundance estimate using bowtie and RSEM

_**NOTE**: should have evaluated quality first as I don't even know if this assembly is the best one, so let's just interpret this as a learning-step, as this might be wasted time if the assembly turns out to have poor quality afterwards_

Created script to run align_and_estimate_abundance.pl to first create a reference against which the individual samples will be aligned and their abundance estimated later.
The script can be found in code/Bash-scripts/Trinity-bash-scripts/trinity_prepref_a-ev.sh

Ran script using:
qsub -pe mpich 4 trinity_prepref_a-ev.sh

Created script to run align_and_estimate_abundance.pl, this time to do the actual alignment and abundance estimation for each individual sample. 
The script can be found in code/Bash-scripts/Trinity-bash-scripts/trinity_RSEM_a-ev.sh
To run this script for each sample change the filename in --single "sample.txt"

Ran script on sample:CL10 using:
qsub -pe mpich 4 trinity_RSEM_a-ev.sh

Did not do any more transcript abundance estimation as I wasn't sure if it was going to be used. Will focus on generating the best assembly first. 

##test_assembly2 (read-normalization)

Used a Trinity run script located in /code/Bash-scripts/Trinity-bash-scripts/trinity_run.sh
Which is used to simply run a trinity assembly on the high_mem node.
The only difference between this assembly and assembly 1, is that in this case read normalization with a coverage treshold of 40 was used.
The same unfiltered/untrimmed raw read data was used in the assembly. Data that can be found:
/data/rna-sex-data.

##mega-assembly
Used script /code/Bash-scripts/Trinity-bash-scripts/trinity_run_megaassembly.sh

100G allocated memory.

Trinity --seqType fq --JM 20G --left ${LOC_PAIR}/1F_fastq-q-filt.txt,${LOC_PAIR}/2F_fastq-q-filt.txt,${LOC_SINGLE}/RNA-sex_all.fq --right ${LOC_PAIR}/1R_fastq-q-filt.txt,${LOC_PAIR}/2R_fastq-q-filt.txt --CPU 8 --
bflyCalculateCPU --output /nobackup/data5/skeletonema_sex_project/test/assembly-test/mega-assembly

This assembly is made of a combination of singleend and pairend RNA-seq reads. The data used is found in:  
Single end reads:   
/test/data-test/rna-sex/RNA-sex_all.fq   
Paired end reads:   
/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results/X_fastq-q-filt.txt  
All data has been trimmed and quality-filtered as described in:   
/test/data-test/rna-sex/README.md  
/test/data-test/skeletonema-pairend-data/README.md

##single-end assembly
Used script /code/Bash-scripts/Trinity-bash-scripts/trinity_run.sh

100G allocated memory.

Trinity --seqType fq --JM 20G --single /nobackup/data5/skeletonema_sex_project/test/data-test/rna-sex/RNA-sex_all.fq --CPU 8 --bflyCalculateCPU --output /nobackup/data5/skeletonema_sex_project/test/assembly-test/single_end-assembly

This assembly is made of singleend RNA-seq reads. The data used is found in:  
Single end reads:   
/test/data-test/rna-sex/RNA-sex_all.fq   
All data has been trimmed and quality-filtered as described in:   
/test/data-test/rna-sex/README.md  


##paired-end assembly
Used script /code/Bash-scripts/Trinity-bash-scripts/trinity_run_pairedend.sh

100G allocated memory.

Trinity --seqType fq --JM 20G --SS_lib_type FR --left ${LOC_PAIR}/1F_fastq-q-filt.txt,${LOC_PAIR}/2F_fastq-q-filt.txt --right ${LOC_PAIR}/1R_fastq-q-filt.txt,${LOC_PAIR}/2R_fastq-q-filt.txt --CPU 8 --bflyCalculateCPU --output /nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly

This assembly is made of paired end RNA-seq reads. The data used is found in:  
Paired end reads:   
/test/data-test/skeletonema-pairend-data/fastq_quality_filter_results/X_fastq-q-filt.txt  
All data has been trimmed and quality-filtered as described in:   
/test/data-test/skeletonema-pairend-data/README.md

###Evaluation of assembly quality

Have found two different softwares for evaluating transcriptome	quality:  
Transrate
Detonate

##Transrate

Planned to run Transrate to evaluate the single-end assemblies, but it appears that the most relevant metrics of Transrate can only be run on paired end data.
Still I ran Transrate with only the first metric which only provides some statistics like N50 of the contigs.
The results are saved on test/assembly-test/transrate-eval

##Detonate

Detonate uses the information from the assembly, the reads used to construct the assembly and the average length of transcripts from the species or a closely related species to calculate a likelihood score.
I was unable to find an average transcript length from skeletonema, so I used the human values instead.
The results are saved on /test/assembly-test/transrate-eval




