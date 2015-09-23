##This is the test-folder for assemblies

In this folder different assemblies produced using different settings will be saved and compared to discover the optimal settings.

###Assembly 1

Purpose:

This assembly was created with the foreknowledge of the low likelihood that this will be the final assembly. The data has not been trimmed or filtered in any way and no extra functions such as k-mer normalization was used in the assembly. This assembly was made to have a point of reference, and because I wasn't sure if these other steps were necessary in the first place, and because I honestly just wanted to see if I could get Trinity to work.


Method:

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

Results:

Concerns during the Trinity run: Very slow run, should probably use more memory for next one.

###Assembly 2
