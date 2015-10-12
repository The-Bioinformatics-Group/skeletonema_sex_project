
#This is the _Skeletonema_-sex-project

____________________________________________________

##Purpose and outline of this projet



____________________________________________________

##Some background regarding the data

Originally 21 RNA samples were intended to be sequenced from 7 different cultures during 3 different time points after exposure to the increased salinity resulting in sexual behaviour. However, something happened to the samples from the 1st timepoint and as such only 14 samples remains. 

The raw sequence data can be found at the location:
/./nobackup/data5/skeletonema_sex_project/data

The data started off in a compressed .gz format. It has subsequently been extracted and renamed according to the sample name:

CL10.txt

Strain: 17BI.
Replicate: 1.
Cellsize: Large.
Treatment: Cue.
Time: 2.

CL11.txt

Strain: 17BI.
Replicate: 2.
Cellsize: Large.
Treatment: Cue.
Time: 2.

CL17.txt

Strain: 17BI.
Replicate: 1.
Cellsize: Large.
Treatment: Cue.
Time: 3.

CL18.txt

Strain: 17BI.
Replicate: 2.
Cellsize: Large.
Treatment: Cue.
Time: 3.

CS12.txt

Strain: 17AS.
Replicate: .
Cellsize: Small.
Treatment: Cue.
Time: 2.

CS13.txt

Strain: 17CS.
Replicate: .
Cellsize: Small.
Treatment: Cue.
Time: 2.

CS14.txt

Strain: 17DS.
Replicate: .
Cellsize: Small.
Treatment: Cue.
Time: 2.

CS19.txt

Strain: 17AS.
Replicate: .
Cellsize: Small.
Treatment: Cue.
Time: 3.

CS20.txt

Strain: 17CS.
Replicate: .
Cellsize: Small.
Treatment: Cue.
Time: 3.

CS21.txt

Strain: 17DS.
Replicate: .
Cellsize: Small.
Treatment: Cue.
Time: 3.

NoCL15.txt

Strain: 17BI.
Replicate: 1.
Cellsize: Large.
Treatment: No Cue.
Time: 3.

NoCL16.txt

Strain: 17BI.
Replicate: 2.
Cellsize: Large.
Treatment: No Cue.
Time: 3.

NoCL8.txt

Strain: 17BI.
Replicate: 1.
Cellsize: Large.
Treatment: No Cue.
Time: 2.

NoCL9.txt

Strain: 17BI.
Replicate: 2.
Cellsize: Large.
Treatment: No Cue.
Time: 2.

___________________________________________________

##What has been done


Extracted all sample files using gunzip script:
/code/Bash-scripts/Misc-scripts/gunzip_run.sh

Ran fastqc on all samples using 4 processor-cores using script:
/code/Bash-scripts/FastQC-bash-scripts/fastqc_run.sh

###FastQC results

The report from all samples was very similar. 
Red flags were shown in three measurements, Per base sequence content and Per base GC content over the first 13 bases,  and Sequence Duplication Levels.
One warning was shown in Kmer Content, with several overrepresented hexamers which is likely due to the hexamer-priming step during the generation of the cDNA from the RNA-fragments. Some hexamers are more efficient primers than others which leads to a more cDNA from certain parts of the transcripts, and consequently an overrepresentation of these kmers. This is also what is responsible for the previously mentioned red flags in Per base sequence content and GC content, though it is surprising that the pattern extends over the hexamer up to 13 bases, but this has been attempted to be explained by a sequence specificity of the polymerase. Either way, this means that there is no point in trimming these 13 bases as they are not errors.
The sequence duplication level is also not a problem but is to be expected in RNA-seq data given that some transcripts may be highly expressed and be present in multiple copies.

###Preparing for assembly

Merged all 14 raw data-files into one txt file to be used in subsequent assembly using script:
code/Bash-scripts/Misc-scripts/join_text.sh
This file was called and located in /data/C6D2PACXX-ALL.txt

###Test assemblies

Made some test-assemblies using Trinity, and evaluated their quality using DETONATE in an attempt to find the best reference assembly to be used to align the reads.
Read more in:
test/assembly-test/README.md




 









