##This directory contains different versions of the _Skeletonema-marinoi_ transcriptome

An overview of the assembly process can be found at the picture:     
transcriptome-assembly-process.png        

Files in directory:             
Separate Trinity-assemblies:      
S.marinoi_transcriptome_megaassembly.fasta     	 
S.marinoi-transcriptome_pairedend.fasta	       	
S.marinoi-transcriptome_singleend.fasta	     
Merged assemblies:     
S.marinoi-transcriptome_3assembliesmerged_noredundancyremoved.fasta    
S.marinoi_transcriptome_3assembliesmerged_cdhitest1.fasta           
S.marinoi_transcriptome_3assembliesmerged_cdhitest2.fasta       
S.marinoi_transcriptome_3assembliesmerged_cdhitest3.fasta                
S.marinoi_transcriptome_3assembliesmerged_cdhitest4.fasta         
S.marinoi_transcriptome_3assembliesmerged_cdhitest5.fasta          
S.marinoi_transcriptome_3assembliesmerged_cdhitest6.fasta        
S.marinoi_transcriptome_3assembliesmerged_cdhitest7.fasta          
S.marinoi_transcriptome_3assembliesmerged_cdhitest8.fasta       
S.marinoi_transcriptome_3assembliesmerged_cdhitest9.fasta       
skeletonema-marinoi_transcriptome_unannotated.fasta

###Description of assemblies 
   
#####S.marinoi_transcriptome_megaassembly.fasta     
Software: Trinity 2.1.1        
Settings: normalize max read coverage 40, Non-strand specific        
Paired-end data:      
1F_*sorted+singletons.fq        
1R_*sorted+singletons.fq       
2F_*sorted+singletons.fq         
2R_*sorted+singletons.fq      
Data located:      
/nobackup/data5/skeletonema_sex_project/data/treated-data/skeletonema-pairend-data/fastq_quality_filter_results               
Single-end data:   
RNA-sex_all.fq (contains all 14 files of separate sample data)   
Data located:    
/nobackup/data5/skeletonema_sex_project/data/treated-data/rna-sex
Contigs: 55670      

#####S.marinoi-transcriptome_pairedend.fasta    
Software: Trinity_r20140717    
Settings: Default, Strand-specific       
Paired-end data:  	   
1F_*sorted+singletons.fq       	
1R_*sorted+singletons.fq       
2F_*sorted+singletons.fq       	 
2R_*sorted+singletons.fq      
Data located:  	   
/nobackup/data5/skeletonema_sex_project/data/treated-data/skeletonema-pairend-data/fastq_quality_filter_results          
Contigs: 72727     

#####S.marinoi-transcriptome_singleend.fasta
Software: Trinity 2.1.1         
Settings: normalize max	read coverage 40, Non-strand specific      
Single-end data:   
RNA-sex_all.fq (contains all 14 files of separate sample data) 	 
Data located:  	 
/nobackup/data5/skeletonema_sex_project/data/treated-data/rna-sex
Contigs: 33004     

#####S.marinoi-transcriptome_3assembliesmerged_noredundancyremoved.fasta
This assembly simply contains all contigs from the three separately created assemblies, with an added M/P/S to the start of each contig name, indicating from which assembly the contig came from.    
Contigs: 161401    

#####CD-HIT-EST - remove redundant contigs

Many different assemblies were created from the merged assembly, using different settings in the software CD-HIT-EST, which is used to remove redundant contigs.     
Assemblies:							Settings:		Contigs:              
S.marinoi_transcriptome_3assembliesmerged_cdhitest1.fasta	-c 1 -n 10		140248       
S.marinoi_transcriptome_3assembliesmerged_cdhitest2.fasta	-c 0.99 -n 10		103719      
S.marinoi_transcriptome_3assembliesmerged_cdhitest3.fasta	-c 0.96 -n 10		58690       
S.marinoi_transcriptome_3assembliesmerged_cdhitest4.fasta	-c 0.94 -n 10		48799         
S.marinoi_transcriptome_3assembliesmerged_cdhitest5.fasta	-c 0.91 -n 10		41472           
S.marinoi_transcriptome_3assembliesmerged_cdhitest6.fasta	-c 0.91 -n 9		41474        
S.marinoi_transcriptome_3assembliesmerged_cdhitest7.fasta	-c 0.90 -n 8		39815        
S.marinoi_transcriptome_3assembliesmerged_cdhitest8.fasta	-c 0.98 -n 10		83251       
S.marinoi_transcriptome_3assembliesmerged_cdhitest9.fasta	-c 0.97 -n 10		68155      

#####skeletonema-marinoi_transcriptome_unannotated.fasta

This is the final assembly used in the Skeletonema marinoi sex-project in the subsequent differential expression analysis and search for sex-related genes.    
This started with the previous mentioned assembly:      
S.marinoi_transcriptome_3assembliesmerged_cdhitest4.fasta	Contigs: 48799
The software Transrate was used, which together with the Thalassiosira pseudonana proteome reference, located:     
/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/thalassiosira_proteome-reference/FilteredModels_proteins_Thaps3_geneModels_FilteredModels2_aa_fixed.fasta             
And the complete pairs of pairedend data, located:      
/nobackup/data5/skeletonema_sex_project/data/treated-data/skeletonema-pairend-data/fastq_quality_filter_results/*_sorted.fastq                 
Was used as support to evaluate the contigs in the assembly.       
The results of this evaluation filtered out contigs as being either "good" or "bad", and the results can be found here and in child-directories:    
/nobackup/data5/skeletonema_sex_project/test/assembly-test/large-assemblies+eval/merged-assembly_3inone/cd-hit-est/4/transrate    
					Contigs:          
good.3merged_settings4.fasta		26300    
bad.3merged_settings4.fasta		22514  
This filtering did however not use all the data, and most importantly for this project, did not use the singleend sex-project data.     
Because of this a second step was used to pick out contigs from the list of "bad contigs" that had support from singleend data unique to the sex-project.     
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
The final results of this is the file:       
skeletonema-marinoi_transcriptome_unannotated.fasta          
