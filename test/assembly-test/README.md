##This is the test-folder for assemblies

In this folder different assemblies produced using different settings will be saved and compared to discover the optimal settings.

##Assembly 1

###Purpose:

This assembly was created with the foreknowledge of the low likelihood that this will be the final assembly. The data has not been trimmed or filtered in any way and no extra functions such as k-mer normalization was used in the assembly. This assembly was made to have a point of reference, and because I wasn't sure if these other steps were necessary in the first place, and because I honestly just wanted to see if I could get Trinity to work.


###Method 1: (*FAILED*)

Data used:

Untouched raw data: 
C6D2PACXX-All.txt
Located on state/partition2 	high_mem node

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

Used same data.

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

###Evaluation of assembly quality

##Assembly 2

Used a Trinity run script located in /code/Bash-scripts/Trinity-bash-scripts/trinity_run.sh
Which is used to simply run a trinity assembly on the high_mem node.
The only difference between this assembly and assembly 1, is that in this case read normalization with a coverage treshold of 40 was used.
The same unfiltered/untrimmed raw read data was used in the assembly. Data that can be found:
/data/rna-sex-data.

###Evaluation of assembly quality







