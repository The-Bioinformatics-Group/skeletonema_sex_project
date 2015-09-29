#This is a directory containing miscellaneous scripts

###gunzip_run.sh
On the sandbox node:
This script simply runs gunzip and unzips .gz files located in /data

###sed_seq-headeredit.sh
On the sandbox node:
Ths script first creates 14 text-files named according to the 14 samples.
It then goes through each original file and exchanges the start of the header of each read (@HWI) with the name of that particular sample (i.e @CL10) and saves the changes and the data in the recently created text-files.


###join_text.sh
On the sandbox node:
This script simply lists the read content of each sample file and outputs it into a single file, called C6D2PACXX-All.txt
