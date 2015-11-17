
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

####FastQC results - paired end data

Overrepresented sequences, meaning the adapter sequences were removed during the trimming step. The per base sequence quality that were pretty low at the 100-151 nts range was improved mainly at the 10th percentile, with an improvement from 24.5 to 30 phred score.  

####Sorting out orphan reads from paired end data

Due to requirements in subsequent analysis' the orphan reads produced from the filtering and trimming of the paired end reads needed to be sorted out to realign the read pairs.
This was done using the script located in: /code/Perl-scripts/removeunpairedreads.pl

###Creating different assemblies

Different settings can be used to create assemblies, and some assemblies have a better quality than others. Being more complete, utilizing a larger portion of the data, producing less chimeric and redundant contigs, etc.
Here different settings are used, and afterwards the different assemblies are evaluated using either detonate or transrate software to see which will be used as a reference for the differential expression analysis.   

Due to having two sets of data, one single end and one paired end, two options exist to utilize this data to produce one reference transcriptome:  
All data is added together and used in one run of Trinity to produce a single assembly. 

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
Ran RSEM which utilizes BowTie to generate an alignment.  
Considerable time was invested during this project to find the fragment length by aligning the trimmed+filtered paired end data from sample1 to the contigs of Assembly1 and looking at the SAM file. However the results from this investigation was very confusing.    
The SAM file consists of lines with information regarding the alignment of a read to a reference contig. One column specifies the start position of the read on the contig, another specifies the start position of the next read mapping to the same contig. Another column holds the "template length" which does not refer to the contig length, but to the total length between the start position of read 1 and the right-most position of the "next read". If all read1 and next-read were part of a pair then this would be the fragment length, however most of the time these reads, the first and the "next read", have different identifiers and hence are not of the same read pair. In some cases however the reads are from the same read pair, but in these cases I have found that the template length have still varied, either showing that there is something wrong somewhere, or that there is not a particular fragment length but a fragment length distribution. I was working on the assumption that there was a particular length, so this was a surprise, but I could create a script to only select those alignments where the two reads are pairs and calculate the average, but this seemed very complicated. Instead I decided to try a software called Qualimap which according to their website could find the fragment length from a SAM file.   
However, I am not sure if Qualimap only takes into account the readpairs when it does this calculation or if it simply takes the average of every template length. Either way I installed qualimap and ran it on the BAM file.    
The results of this can be found:   
/test/assembly-test/paired_end_assembly/align_and_estimate_abundance/qualimap_results/   
In short it displays the mean insert size as: 284.07   
Meaning that the fragment size ought to be (+302): 586.07   
One way to investigate if this fragment size is likely to be correct, is to do the same evalutaion on the second paired end assembly, however, it would require a few days extra work.  

It was possible to simply run Transrate, and this was done, although it never finished for different reasons. First it stopped because it identified unpaired reads in the paired end data due to the filtering step. Then after removing the orphan reads as described earlier, it stopped for some unknown reason. A couple of times the run was interrupted due to server restarts.   
Finally Transrate managed to finish on both assembly 1 and 2, using only the paired reads - the orphan reads sorted out.    
The max score from Transrate is 1, and the worst score is 0.   
The score for these assemblies were:   
A1: 0.1024   
A2: 0.0751   
These scores are not that great. 
But at this point the project has been standing still for too long and I want to make progress. If the assembly turns out to have poor quality later on, then this might need to be revisited, although I doubt it.
Based on these scores, Assembly1 will be merged with the best-quality single-end assembly, and Assembly2 will be removed to conserve disk space.  
Still, I will run Detonate with the discovered fragment length before I remove Assembly2.   
Detonate scores strive towards coming as close to 0 as possible. Meaning larger negative values signify a poorer assembly.   
Detonate score:    
A1:-13205216495.69   
A2:-12844110715.92   
Unfortunately these scores do not agree.   
The question is, what score should be trusted?  

Detonate requires three parameters to carry out its evaluation beyond the data, either single end or paired end.   
The first parameter is, in the case of single end reads, average read length, and in paired end reads, average fragment length. The other two parameters are average transcript length and standard deviation of transcript length from the species or a closely related species.   
Problematic:  
Average transcript length and standard deviation of transcript length is unknown in S. Marinoi. Instead the human values for this has been used, and it is then questionable how reliable the evaluation is.    

Transrate can only be used for paired end assemblies but it doesn't require any extra information beyond the data.   
Problematic:   
If unpaired reads exist in the data, the evaluation is stopped. My paired end reads has been sorted and orphan reads has been put into a separate file, and these orphan reads compose roughly 10% of the total reads used to construct the assembly, which means that 10% of reads used to produce the assembly is not used in the evaluation of it.   

Transrate is the newer of the softwares, and according to the tests they did to compare the ability of the two softwares to measure assembly accuracy on simulated data, Transrate received a better score. 
In the end I chose to trust the Transrate-score, removing the paired end assembly with readnormalization. I will also use Transrate for future evaluation of paired end reads.     

 
###Merging assemblies/Removing redundant contigs  

Assembly of reads often result in falsely reported isoforms due to sequencing errors or small geneti variation between samples.
These redundant contigs reduces the effectiveness of differential expression analysis by for instance allocating reads between many similar contigs when they in reality originate from one particular gene.    
This will be especially relevant for the merging of the two assemblies, one consisting of the single-end reads and the other of paired end reads.      
To merge the single and paired-end assemblies and remove redundant contigs from the mega-assembly, Corset will be used (tried CD-HIT-EST, but it seemed difficult to distinguish between isoforms+paralogs from false isoforms caused by sequencing errors etc using this program).

Corset hierarchically clusters contigs based on the proportion of shared reads and expression patterns between samples. For this it requires separate bam-files containing alignments for each sample against the assembly, where all reads from the sample has been multi-mapped to the contigs.     
The multi-mapped reads are used as a proxy for detecting sequence similarity between the contigs, as well as providing information about the expression level of the contigs. Contigs with a low number of mapped reads, less than 10 reads are filtered out. Corset clusters contigs based on shared reads, but seperates contigs when different expression patterns between samples are observed. The distance between any two contigs is defined in relation to the number of reads that are shared between contigs such that a lower proportion of shared reads results in a larger distance. Genes that share sequence, such as paralogues, are likely to have small distsances, as many reads are shared. Corset seperates them by comparing relative expression. If the relative expression between them is not constant, the distance between them is set to max.   
The clusters that are generated from this Corset run will be evaluated, and depending on the results, either the clustered merged or the mega-assembly will be used in the differential expression.   

####Aligning with Bowtie

Aligned each individual sample, paired end and single end reads, separately to first the mega-assembly then the merged assembly.   


####Merging with Corset

####Mega-assembly
This assembly was made using all filtered and trimmed data, both single and paired end data in the same trinity run.  
Used Trinity version: 2.1.1. With Java version: 1.7.
Used normalize max read coverage: 40

##Evaluation of the two large assemblies to find reference








 









