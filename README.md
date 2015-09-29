
#This is the _Skeletonema_-sex-project

____________________________________________________

##Purpose and outline of this projet



____________________________________________________

##Some background regarding the data

Originally 21 RNA samples were intended to be sequenced from 7 different cultures during 3 different time points after exposure to the increased salinity resulting in sexual behaviour. However, something happened to the samples from the 1st timepoint and as such only 14 samples remains. 

The raw sequence data can be found at the location:
/./nobackup/data5/skeletonema_sex_project/data

The data starts off in a compressed .gz format, and are named and correspond to:

C6D2PACXX_CL10_15s010306-1-1_Ferrante_lane115s010306_sequence.txt.gz
Strain: 17BI.
Replicate: 1.
Cellsize: Large.
Treatment: Cue.
Time: 2.

C6D2PACXX_CL11_15s010307-1-1_Ferrante_lane115s010307_sequence.txt.gz.
Strain: 17BI.
Replicate: 2.
Cellsize: Large.
Treatment: Cue.
Time: 2.

C6D2PACXX_CL17_15s010313-1-1_Ferrante_lane115s010313_sequence.txt.gz.
Strain: 17BI.
Replicate: 1.
Cellsize: Large.
Treatment: Cue.
Time: 3.

C6D2PACXX_CL18_15s010314-1-1_Ferrante_lane115s010314_sequence.txt.gz.
Strain: 17BI.
Replicate: 2.
Cellsize: Large.
Treatment: Cue.
Time: 3.

C6D2PACXX_CS12_15s010308-1-1_Ferrante_lane115s010308_sequence.txt.gz.
Strain: 17AS.
Replicate: .
Cellsize: Small.
Treatment: Cue.
Time: 2.

C6D2PACXX_CS13_15s010309-1-1_Ferrante_lane115s010309_sequence.txt.gz.
Strain: 17CS.
Replicate: .
Cellsize: Small.
Treatment: Cue.
Time: 2.

C6D2PACXX_CS14_15s010310-1-1_Ferrante_lane115s010310_sequence.txt.gz.
Strain: 17DS.
Replicate: .
Cellsize: Small.
Treatment: Cue.
Time: 2.

C6D2PACXX_CS19_15s010315-1-1_Ferrante_lane115s010315_sequence.txt.gz.
Strain: 17AS.
Replicate: .
Cellsize: Small.
Treatment: Cue.
Time: 3.

C6D2PACXX_CS20_15s010316-1-1_Ferrante_lane115s010316_sequence.txt.gz.
Strain: 17CS.
Replicate: .
Cellsize: Small.
Treatment: Cue.
Time: 3.

C6D2PACXX_CS21_15s010317-1-1_Ferrante_lane115s010317_sequence.txt.gz.
Strain: 17DS.
Replicate: .
Cellsize: Small.
Treatment: Cue.
Time: 3.

C6D2PACXX_NoCL15_15s010311-1-1_Ferrante_lane115s010311_sequence.txt.gz.
Strain: 17BI.
Replicate: 1.
Cellsize: Large.
Treatment: No Cue.
Time: 3.

C6D2PACXX_NoCL16_15s010312-1-1_Ferrante_lane115s010312_sequence.txt.gz.
Strain: 17BI.
Replicate: 2.
Cellsize: Large.
Treatment: No Cue.
Time: 3.

C6D2PACXX_NoCL8_15s010304-1-1_Ferrante_lane115s010304_sequence.txt.gz.
Strain: 17BI.
Replicate: 1.
Cellsize: Large.
Treatment: No Cue.
Time: 2.

C6D2PACXX_NoCL9_15s010305-1-1_Ferrante_lane115s010305_sequence.txt.gz.
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

Made some test-assemblies using Trinity, and evaluated their quality using DETONATE.
Read more in:
test/assembly-test/README.md


 









