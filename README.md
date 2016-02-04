
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
/nobackup/data5/skeletonema_sex_project/data/raw-data

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
/nobackup/data5/skeletonema_sex_project/data/raw-data/pairedend-data   
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
The details of the fastqc analysis can be found in data/raw-data/rna-sex-data/fastqc-results   


#####FastQC results - paired end data

Read size: 151nts.  
Similar to the single end data there are overrepresented kmers which likely results from the same hexamer-priming step in the library preperation. This as a result is probably also responsible for the bias in per base sequence content and per base GC content in the first 13 nts similar to the single end data.  
The difference between the single end data and this is that the forward reads in this data has overrepresented sequences in the form of illumina truseq adaptors, and that the reverse data has pretty poor quality towards the end of the reads in the last 35% of the reads. But the mean quality of all samples are pretty good.     
The details of the fastqc analysis can be found in data/raw-data/pairedend-data/fastqcresults-pairedend-data   

####Filtering and Trimming data

Treated both single end and paired end data the same.      
Software used: cutadapt, fastq-quality-filter.   
The specific settings and the trimmed and filtered data can be found in the data/treated-data/ directory   
First cutadapt was used to remove adapters and trim low quality ends, then fastq-quality-filter was used to remove reads with poor quality.   
The results of the cutadapt can be found in each respective data-folder in data/treated-data/X/cutadapt-reports   


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
These sorted pair-data can be found together with the other paired-end data containing orphaned reads and only the singlets sorted out, here:   
data/treated-data/skeletonema-pairend-data/fastq_quality_filter_results/*sorted.fastq    

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
Location of merged assembly with and without header:    
/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/    

Scripts used to run CD-HIT-EST are located:   
/nobackup/data5/skeletonema_sex_project/code/Bash-scripts/CD-HIT-EST   

Ran CD-HIT-EST several times using different settings and investigated the cluster-sizes and number of contigs.   
						Contigs:         
Paired						72727    
Single						33004    
Mega						55670    
Original Merged					161401    
CD-HIT-EST, run:        Settings:         
1			-c 1 -n 10		140248    
2			-c 0.99 -n 10		103719    
8			-c 0.98 -n 10		83251    
9			-c 0.97 -n 10		68155     
3			-c 0.96 -n 10		58690    
4			-c 0.94 -n 10		48799    
5			-c 0.91 -n 10		41472     
6			-c 0.91 -n 9		41474     
7			-c 0.90 -n 8		39815    

Plotted the cluster-sizes ( how many clusters contained 1 contig, 2 contigs, etc...) in a histogram using script located at:    
/nobackup/data5/skeletonema_sex_project/code/Bash-scripts/CD-HIT-EST/clstr_stats.sh

In the merged, un-filtered assembly one would expect there to first of all be redundant contigs of the same allele, assembled separately in the 3 different runs from the same data. We would also expect different alleles, different isoforms, and lastly paralogs.         
This setting of CD-HIT-EST compares identity not across the entirety of both sequences, but across the length of the shorter of the two compared sequences. For example, -c 94 means that if contig1 is aligned to a shorter contig2 of 500nt, then as long as 470 of contig2 is identical to the representative, contig1, the contig2 will be clustered to contig1. Any smaller number of aligned nts and contig2 would not be clustered to contig1.   
CD-HIT-EST 4 was selected as the best setting for filtering.    
This and the other CD-HIT-EST results can be found in:   
/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est    

###Transrate with Thalassiosira proteome-ref

To filter out faulty assembled transcripts like chimeric transcripts, Transrate was used which utilizes the information in paired end data and the thalassiosira proteome-reference to evaluate the support for the contigs in the assembly, providing a likelihood score for each and removing all contigs with a poor score.   
Since the single end data is not used in this evaluation, this means that unique contigs to the single end data would likely be removed, but these will be retrieved separately later using RSEM-eval which performs a similar evaluation but unlike transrate, can also handle single end data. Another issue is that the pairedend data lost some read pairs in the data-filteringstep which means that some reads are orphaned (roughly 8%). Transrate can only perform its evaluation with complete readpairs, which means that only this data was used in the evaluation.   
The evaluation was carried out using the script located in:    
/nobackup/data5/skeletonema_sex_project/code/Bash-scripts/Transrate-Transcriptome-Eval/transrate_run_mergedas.sh

This evaluation used the filtered and trimmed paired end data with complete readpairs located in:   
/nobackup/data5/skeletonema_sex_project/data/treated-data/skeletonema-pairend-data/fastq_quality_filter_results/*_sorted.fastq    
Together with the Thalassiosira proteome reference located in:    
/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/thalassiosira_proteome-reference/FilteredModels_proteins_Thaps3_geneModels_FilteredModels2_aa_fixed.fasta    
Against the assembly located in:    
/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/4/3merged_settings4.fasta

The results of this evaluation were can be found here and in child-directories:    
/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/4/transrate    
					Contigs:          
good.3merged_settings4.fasta		26300    
bad.3merged_settings4.fasta		22514    
 
###Picking out unique transcripts from sex-project data

The transrate evaluation step potentially removed transcripts that are unique to the sex-project data, and which might be very relevant to this project. These transcripts will be in the list of "bad" contigs.    
To return these contigs to the transcriptome all the single end RNA-seq data will be mapped to the list of "good" contigs, and all reads that did not map to the existing contigs will later be used to extract contigs from the list of "bad" contigs based on the support of the reads using RSEM-eval.    
To map the single end reads and pick out the unmapped reads, the script mapping_filtering.sh was used. Located here:    
/nobackup/data5/skeletonema_sex_project/code/Bash-scripts/Misc-scripts/mapping_filtering.sh    
The output from this are two fastq files with the mapped reads and the unmapped reads respectively. These can be found here:   
/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/4/transrate/3merged_settings4/search-uniquetranscripts_2015_12_08    

The unmapped reads were next mapped against the "bad contigs" sorted out during the transrate step due to having poor support from the thalassiosira proteome and the paired end reads. This was done using RSEM-eval which uses bowtie to map the reads. This was done using the script located here:    
/nobackup/data5/skeletonema_sex_project/code/Bash-scripts/Detonate-Transcriptome-Eval/detonate_rsem_runlarge2.sh    
RSEM-eval also requires information regarding the average transcript length and standard deviation of transcript length of the organism in question, or a closely related species. For this thalassiosira was used. Calculated to:   
Mean transcript length: 1556.003     
Transcript length SD: 1289.489    

The result of this analysis is saved at:    
/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/4/transrate/3merged_settings4/search-uniquetranscripts_2015_12_08/RSEM-eval-results    
The file, badcontigs_searchunique.score.isoforms.results, holds the score and stats of all contigs.     
From this file, all contigs with a positive "contig impact score" was extracted and merged with the file containing the "good contigs" from the transrate filtering step.    
This is the final transcriptome and can, along with other transcriptome-versions be located:   
/nobackup/data5/skeletonema_sex_project/transcriptome/skeletonema-marinoi_transcriptome_unannotated.fasta      

##Differential expression analysis

First need to map the reads to the transcriptome to produce a countmatrix where each read is only mapped once.   
The reads were multi-mapped to the transcriptome using the script located in:
/nobackup/data5/skeletonema_sex_project/code/Bash-scripts/Transcript-abundance-estimation/trinity_RSEM_a-evl.sh    
This script utilizes the trinity perl-script: /usr/local/bin/trinityrnaseq_r20140717/util/align_and_estimate_abundance.pl     
This script uses bowtie2 for mapping the single end reads one sample at a time to the transcriptome. The resulting bam files are located here:
/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcript-abundance-est/RSEM_1/sampleX    
The mapping settings in this script is fairly strict, which reduces the number of ambigiously mapped reads.   
The multimapped reads were resolved using the script located in:   
/nobackup/data5/skeletonema_sex_project/code/Bash-scripts/Transcript-abundance-estimation/trinity_countmatrix.sh    
This script utilizes the trinity perl script: /usr/local/bin/trinityrnaseq_r20140717/util/abundance_estimates_to_matrix.pl     
The output from this script is the count matrix, with all contigs and how many reads are mapped to each one from each sample. This can be be found here:   
/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcript-abundance-est/RSEM_1/count_matrix_corrected/matrix.counts.matrix      

Two R-scripts were created to conduct the Differential Expression analysis, one which uses all samples to perform the filtering of lowly expressed contigs, and dispersion estimation, and one script which only uses the samples of the experimental groups that are compared to eachother.    
Both R-scripts were created to conduct the Differential Expression analysis using the package EdgeR. (R-version 3.0.2).   

The script that only carries out dispersion estimation using the samples that are compared, can be located at:   
/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/differential-expression/DifferentialExpression_limitedestimation/DEanalysisSexproject_limitedestimation.R    
This script loads the matrix.count.matrix file, and starts the DE analysis in parallel, for comparison between small+cue vs large+cue for time1 and time2, respectively. It starts out by filtering out poorly expressed contigs (keeping contigs that have at least above 1 CPM in at least 2 samples). It then normalizes the counts according to sample library size. To investigate the similarity between the samples and see how well the replicate correlate MDS-plots are created. The dispersion of expression across replicates is estimated and the tagwise, common and trend estimation is plotted in BCV plots. Then the data is fitted to the estimation model. The contrasts are made between experimental groups, small+cue vs large+cue. Finally the names of significantly DE contigs with less than 5%FDR is outputted in a table: DE_Contignames_2(or 3).ods, and a table of 10000 contigs with DE values, sorted on P-value is outputted into a separate table.    
The bash script located in the same directory: grep_for_DEtranscripts.sh, extracts the significantly DE contigs from the list of 10000 and puts them in a separate table.
Significantly DE contigs can be found in files:       
DE2_limitedestimation.ods        
DE3_limitedestimation.ods         
 
The script that uses all samples for the dispersion estimation and filtering of poorly expressed transcripts can be located:      
/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/differential-expression/DifferentialExpression_allsamples/DEanalysisSexproject_allsamples.R       
The difference between this and the previous script is that this creates a DGE-object and design-matrix containing samples from all experimental groups, and the subsequent filtering of poorly expressed transcripts, and the dispersion estimation uses data from all samples. Another difference is that this script also compares the different timepoints to eachother. Comparing which genes relevant to cellsize and sex has changed expression from timepoint 2 and 3.               
Like the previous script this produces an output of two different tables. One consisting of all the names of those contigs considered significantly differentially expressed, *contignames.txt, and the other containing the DE-stats of 10000 contigs sorted on P-value.        
A bash-script: grep-for_DEtranscripts.sh is used to pick out the significant DE-contigs of the name-table from the table containing the 10000contigs.      
Significantly DE contigs can be found in files:        
DE2_allsamples.ods       
DE3_allsamples.ods        
DE2V3_allsamples.ods           
DE3V2_allsamples.ods        

##Blasting for sex-genes

Two lists of sex-related genes were found in two separate articles:         
Patil et al, 2015		Identification of the meiotic toolkit in diatoms and exploration of meiosis-specific SPO11 and RAD51 homologs in the sexual species Pseudonitzschia multistriata and Seminavis robusta        
von Dassow et al, 2009		Transcriptome analysis of functional differentiation between haplid and diploid cells of Emiliania huxleyi, a globally significant photosynthetic calcifying cell    

The first one provided a list of 58 meiosis-related proteins with corresponding accession-numbers.           
These aminoacid fasta-sequences came when available from Arabidopsis Thaliana, and otherwise from Sacchaomyces Cerevisiaewere, and were downloaded from NCBI. These can be found here:         
/nobackup/data5/skeletonema_sex_project/blast_for_sex-genes/58athal+scere-meiosisgenes/meiosis_athal+scerv.fa
The second one provided a list of 126 proteins with the majority connected to flagella function from a variety of species but mainly Clamydomonas reinhardtii, also with accession-numbers.               
These aminoacid fasta-sequences were downloaded from Uniprot.       
Next they were used as query in a tBLASTn search against the transcriptome which had been converted into a blastable database, located here:     
/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/transcriptome-blast_db      
Using these settings:       
-matrix BLOSUM62 -evalue 0.01 -gapopen 11 -gapextend 1 - word_size 6      
This was run two times for each list of genes, one with outformat0 and one with outformat7.      
The results of this are saved here:    
/nobackup/data5/skeletonema_sex_project/blast_for_sex-genes/58athal+scere-meiosisgenes/blastresults_outfmt*        
/nobackup/data5/skeletonema_sex_project/blast_for_sex-genes/flagellagenes/blastresults_outfmt7_flagella.txt           
Next the five best contig hits for each gene (if available) was taken out from outformat7 and placed in a separate text file. This was done using the bash-script:           
/nobackup/data5/skeletonema_sex_project/blast_for_sex-genes/selectonly5best.sh            
All duplicated contigs were removed from the output from this script, using a simple: cat file.txt | sort -u > newfile.txt      
This list of contigs was next used in a blastx search against the uniprot database, with the following settings:      
-db swissprot -evalue 0.01 -max_target_seqs 5 (or -num_alignments 5 for outformat 0) -word_size 6 -gapopen 11 -gapextend 1 -remote -matrix BLOSUM 62     
This was run for both sets, and once for each outformat 7 and 0.         
The results of this are saved here:        
/nobackup/data5/skeletonema_sex_project/blast_for_sex-genes/58athal+scere-meiosisgenes/uniprot_results       
/nobackup/data5/skeletonema_sex_project/blast_for_sex-genes/flagellagenes/uniprot_results      

Finally these results, included if the contig was differentially expressed in time2 and 3 were all summarized in a table using a bash-script, located here:      
/nobackup/data5/skeletonema_sex_project/blast_for_sex-genes/createtablewithresults.sh         
The created table has the following organization:         
GENEID	GENEANNOTATION	Contighit1	Evalue	Bitscore	BestUniprothit	Evalue	Bitscore	DE2logF DE2Pvalue	DE3logF	DE3Pvalue Contig2...etc.            
And was used with the input files in the same folder:       
1: sexgenes_allids.txt        
2: sexgenes_allannostuff.txt        
3: sexgenes_alltranscriptomehits_outfmt7.txt       
4: sexgenes_alluniprothits_outfmt7.txt      
5: DE2.ods       
6: DE3.ods        
These files contain the combined information from the two sets of sex-related genes.    
The resulting table can be found in the same folder here:      
table_with_sexgene-results_2conditionsatatime

##Transcriptome-annotation

Still ongoing
