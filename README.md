
#This is the _Skeletonema_-sex-project

Welcome to the git repository of the _Skeletonema Marinoi_ sex-project. 
____________________________________________________

###Purpose and outline of this projet

This is a differential expression project studying the reproduction of the diatom _Skeletonema Marinoi_.

____________________________________________________

###Some background regarding the data

####Single end reads from sex-project

Originally 21 RNA samples were intended to be sequenced from 7 different cultures during 3 different time points after exposure to the increased salinity resulting in sexual behaviour. However, something happened to the samples from the 1st timepoint and as such only 14 samples remains.  

The raw sequence data can be found at the location:   
/nobackup/data5/skeletonema_sex_project/data

The data started off in a compressed .gz format. It has subsequently been extracted and renamed according to the sample name:  

CL10.txt  
Strain: 17BI    
Replicate: 1  
Cellsize: Large  
Treatment: Cue   
Time: 2   

CL11.txt  
Strain: 17BI    
Replicate: 2  
Cellsize: Large   
Treatment: Cue   
Time: 2   

CL17.txt   
Strain: 17BI   
Replicate: 1   
Cellsize: Large   
Treatment: Cue   
Time: 3   
   
CL18.txt   
Strain: 17BI   
Replicate: 2   
Cellsize: Large   
Treatment: Cue  
Time: 3   

CS12.txt   
Strain: 17AS  
Replicate:   
Cellsize: Small   
Treatment: Cue   
Time: 2   

CS13.txt  
Strain: 17CS   
Replicate:   
Cellsize: Small   
Treatment: Cue   
Time: 2   

CS14.txt   
Strain: 17DS   
Replicate:   
Cellsize: Small   
Treatment: Cue   
Time: 2   

CS19.txt    
Strain: 17AS   
Replicate:   
Cellsize: Small   
Treatment: Cue   
Time: 3   

CS20.txt   
Strain: 17CS   
Replicate:    
Cellsize: Small   
Treatment: Cue   
Time: 3   

CS21.txt   
Strain: 17DS   
Replicate:   
Cellsize: Small   
Treatment: Cue   
Time: 3   

NoCL15.txt   
Strain: 17BI   
Replicate: 1  
Cellsize: Large   
Treatment: No Cue   
Time: 3   

NoCL16.txt   
Strain: 17BI   
Replicate: 2   
Cellsize: Large   
Treatment: No Cue   
Time: 3   

NoCL8.txt    
Strain: 17BI   
Replicate: 1   
Cellsize: Large   
Treatment: No Cue   
Time: 2   

NoCL9.txt    
Strain: 17BI   
Replicate: 2  
Cellsize: Large   
Treatment: No Cue   
Time: 2   

####Skeletonema paired end data

This data was used in a previous project carried out by someone else, and the idea here is to use it simply to get a more complete trancriptome reference assembly to map the single end reads against.   
The raw data can be found in:   
/nobackup/data5/skeletonema_sex_project/data/pairedend-data   
And is named:   
1_131004_AH72EEADXX_P705_101F_dual93_1.fastq
1_131004_AH72EEADXX_P705_101F_dual93_2.fastq
2_131004_AH72EEADXX_P705_101F_dual93_1.fastq
2_131004_AH72EEADXX_P705_101F_dual93_2.fastq        
This data is strand specific and the only relevance to be found in their names for this project is simply:   
Sample1 Forward reads  
Sample1 Reverse reads    
Sample2 Forward reads   
Sample2 Reverse reads   

___________________________________________________

##What has been done

###Data-handling

Overview:
Ran fastqc on all samples.   
Performed appropriate filtering/trimming.   
New fastqc run on all trimmed and filtered reads.
Removed orphan-reads from paired end assembly.

####FastQC analysis

Ran fastqc on all samples using 4 processor-cores using script:   
/code/Bash-scripts/FastQC-bash-scripts/fastqc_run.sh   


#####FastQC results - single end data

Read size: 51nts.  
The report from all samples was very similar.   
Red flags were shown in three measurements, Per base sequence content and Per base GC content over the first 13 bases,  and Sequence Duplication Levels.   
One warning was shown in Kmer Content, with several overrepresented hexamers which is likely due to the hexamer-priming step during the generation of the cDNA from the RNA-fragments. Some hexamers are more efficient primers than others which leads to a more cDNA from certain parts of the transcripts, and consequently an overrepresentation of these kmers. This is also what is responsible for the previously mentioned red flags in Per base sequence content and GC content, though it is surprising that the pattern extends over the hexamer up to 13 bases, but this has been attempted to be explained by a sequence specificity of the polymerase. Either way, this means that there is no point in trimming these 13 bases as they are not errors.   
The sequence duplication level is also not a problem but is to be expected in RNA-seq data given that some transcripts may be highly expressed and be present in multiple copies.   
There was no warning about overrepresented sequences meaning that it is unlikely to contain many adapter sequences.   
The details of the fastqc analysis can be found in data/rna-sex-data/fastqc-results   


#####FastQC results - paired end data

Read size: 151nts.  
Similar to the single end data there are overrepresented kmers which likely results from the same hexamer-priming step in the library preperation. This as a result is probably also responsible for the bias in per base sequence content and per base GC content in the first 13 nts similar to the single end data.  
The difference between the single end data and this is that the forward reads in this data has overrepresented sequences in the form of illumina truseq adaptors, and that the reverse data has pretty poor quality towards the end of the reads in the last 35% of the reads. But the mean quality of all samples are pretty good.     
The details of the fastqc analysis can be found in data/pairedend-data/fastqcresults-pairedend-data   

####Filtering and Trimming data

Treated both single end and paired end data the same.      
Software used: cutadapt, fastq-quality-filter.   
The specific settings and the trimmed and filtered data can be found in the /test/data-test directory   
First cutadapt was used to remove adapters and trim low quality ends, then fastq-quality-filter was used to remove reads with poor quality.   
The results of the cutadapt can be found in each respective data-folder in /test/data-test/X/cutadapt-reports   


####FastQC results - single end data

Investigated the report files from the single-end data, and as expected the report looked very similar as before. The phred score at all positions were already pretty good, all with a median and mean phred score above 35, so it was not surprising to see that little had changed here as the quality-filtering and end-trimming was set at 20 and 15 respectively.    
The kmer and per base GC and sequence content was the same also as expected, due to the hexamer priming step. There were no overrepresented sequences prior to the adapter-trimming and none after. The only thing that was a little different was the change in read-length, with some reads slightly shorter than 51 bases due to the trimming.    
Despite the previous fastqc report not reporting any overrepresented sequences, the cutadapt did find adapter sequences and removed them.
To ensure that the kmer/per base GC/Sequence-content was not the result of sequencing errors or partial adapter-sequences, a test was carried out where the first 14 bases were trimmed off the data and their ability to map to a paired end assembly was compared with the ability of the un-trimmed data. The result of this showed little differences in mapping-frequency, with only about 8% unmapping reads from both data-sets.     

####FastQC results - paired end data

Overrepresented sequences, meaning the adapter sequences were removed during the trimming step. The per base sequence quality that were pretty low at the 100-151 nts range was improved mainly at the 10th percentile, with an improvement from 24.5 to 30 phred score.  

####Sorting out orphan reads from paired end data

Due to requirements in subsequent analysis' the orphan reads produced from the filtering and trimming of the paired end reads needed to be sorted out to realign the read pairs.
This was done using the script located in: /code/Perl-scripts/removeunpairedreads.pl

##Creating a reference transcriptome

The plan here has changed throughout the project. But eventually it was decided to settle on this approach:   
Create three different assemblies using Trinity, one consisting solely of single end data, another of only paired end data, and finally one assembly with all data used together, then merge all 3 together and remove redundancy.    
The reason for doing it this way is because different approaches have different advantages with regards to assembly quality. Trinity can use both single and paired end data to at once, however, doing so loses strand-specific information and gives Trinity less information to work with to create the most accurate assembly. In contrast, assembling single and paired end data separately maintains the strand-specific information, but instead lowly expressed transcripts might be lost due to a lack of sufficient read-support from either data-set, but which when combined could be assembled.   

First different assemblies need to be made, and evaluated to find which ones are the most suitable to be merged.    

###Creating different assemblies

Different settings can be used to create assemblies, and some assemblies have a better quality than others. Being more complete, utilizing a larger portion of the data, producing less chimeric and redundant contigs, etc.
Here different settings are used, and afterwards the different assemblies are evaluated using either detonate or transrate software to see which ones will be merged to create the transcriptome.      

####Single end assemblies

#####assembly1
Used raw single end data.   
Used Trinity version: trinityrnaseq_r20140717   
Default settings in Trinity.   

#####assembly2
Used raw single	end data.   
Used Trinity version: trinityrnaseq_r20140717   
Used normalize max read coverage: 40   

#####assembly3
Used the filtered+trimmed data.
Used Trinity version: trinityrnaseq_r20140717 
Default settings in Trinity.  

#####assembly4
Used the filtered+trimmed data.     
Used Trinity version: 2.1.1. With Java version: 1.7.   
Used normalize max read coverage: 40  

####Evaluation of single end assemblies

Two softwares were identified and recommended to be used in evaluation of de novo transcriptomes:   
Transrate and Detonate.
However. Transrate can only be used to evaluate paired end assemblies, and because of this detonate was used in this instance.  
Detonate uses the average transcript length of a closely related organism, and the standard deviation of the transcript length in the statistical evaluation of the assembly quality. However, this does not exist for Skeletonema Marinoi. Average transcript length for Thalassiosira was found, but not the standard deviation of the transcript length.  
In the end, the human values were used for this, and was selected quite arbitrarily based on the the average transcript length of Thalassiosira in comparison to Humans, which was quite similar.  
The detonate score should be as close to 0 as possible. The larger the negative number, the worse the assembly quality.  
Scores:   
A1: -3.7E+9   
A2: -3.6E+9   
A3: -3.5E+9   
A4: -3.4E+9   

Based on this score. A4 was chosen as the best single end assembly, and the rest were removed to conserve disk space.   
Details of the scores can be found in /test/assembly-test/detonate-eval/    
This assembly can be found:    
/nobackup/data5/skeletonema_sex_project/test/assembly-test/single_end-assembly_readnorm_trinity

####Paired end assemblies

These assemblies takes up a lot of disk space and takes a lot of time to assemble. For this reason only two assembly settings will be tested.

#####assembly 1
Used the filtered+trimmed data.
Used Trinity version: trinityrnaseq_r20140717 
Default	settings in Trinity. 

#####assembly 2
Used the filtered+trimmed data.	  
Used Trinity version: 2.1.1. With Java version:	1.7.   
Used normalize max read	coverage: 40  

####Evaluation of paired end assemblies

Both Detonate and Transrate work for evaluating paired end assemblies. However, while detonate evaluation of single end assemblies requires average read length, which in that case was 51, for paired end assemblies it requires the average fragment length which is unknown in this project.
Considerable time was spent searching for this fragment length, and in the end the average length was suggested to be around 280nt. Still, in the end Transrate was decided to be used instead.  

Used Transrate to evaluate paired end assemblies. First it stopped because Transrate identified unpaired reads in the paired end data due to the filtering step. Sorted out the orphaned reads as described in the data-section, and simply used the paired data for the evaluation.    
To be noted: Around 10% of the paired end data was orphaned, which means that 10% of the paired end data was not used in this evaluation.      
    
The max score from Transrate is 1, and the worst score is 0. Transrate did an evaluation of 155 published transcriptomes to test their software. The scores ranged between 0.52 - 0.001, with an average of around 0.3.    
   
The score for these 2 assemblies were:   
A1: 0.1024   
A2: 0.0751   
These scores are not that great, but it could be noted that 10% of the data was not used in this evaluation due to them being orphan-reads.   

Based on these scores, Assembly1 will be merged with the other two assemblies, and Assembly2 will be removed to conserve disk space.  
This assembly can be found:    
/nobackup/data5/skeletonema_sex_project/test/assembly-test/paired_end_assembly
 

###Creating assembly with all data (mega-assembly)   

This assembly was made using all filtered and trimmed data, both single and paired end data in the same Trinity-run.   
Used Trinity version: 2.1.1. With Java version: 1.7.   
Used normalize max read coverage: 40.   
This assembly can be found:    
/nobackup/data5/skeletonema_sex_project/test/assembly-test/mega-assembly    


###Merging assemblies/Removing redundant contigs using CD-HIT-EST

Assembly of reads often result in falsely reported isoforms due to sequencing errors or small genetic variation between samples.
These redundant contigs reduces the effectiveness of differential expression analysis by for instance allocating reads between many similar contigs when they in reality originate from one particular gene.    
This will be especially relevant for the merging of the three assemblies, one consisting of the single-end reads, another of paired end reads, and the third with all data together at once.          

Because these assemblies were built separately, many contigs had the same name. To avoid problems in future steps the contig-names within each assembly were changed by addition of a letter before the contignames of each assembly.    
S for singleend   
P for pairedend    
M for megaassembly   

These header-changed fasta-files were merged together into one, and different settings in CD-HIT-EST were used to remove redundancy and different alleles while conserving paralogs.   







 









