##This directory contains scripts for running Trinity or various  applications connected to Trinity

###trinity_RSEM_a.ev.sh

This script is run on the high_mem node.
The purpose of this script is to estimate the abundance of transcripts by aligning reads using bowtie and estimating the abundance of the transcripts with RSEM.
To run this script, trinity_prepref_a.ev.sh needs to be run beforehand to treat the assembly so that it can be used as a reference.


###trinity_prepref_a.ev.sh

This script is run on the high_mem node.
The purpose of this script is to create a reference against which reads can later be aligned and be used to estimate transcript abundance using the script trinity_RSEM_a.ev.sh

###trinity_run.sh

This script is run on the high_mem node.
The purpose of this script is to run Trinity. The settings can be changed in the script to suit each individual assembly, including the allocated memory from the high_mem node.

###trinity_run_megaassembly.sh

This script runs trinity using both singleend and pairend RNA-seq reads. 
