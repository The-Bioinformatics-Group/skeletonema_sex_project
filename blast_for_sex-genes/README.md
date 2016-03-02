Next these "sex-proteins" were used as query in a tBLASTn search against the transcriptome which had been converted into a blastable database, located here:     
/nobackup/data5/skeletonema_sex_project/differential-expression-analysis/transcriptome/transcriptome-blast_db      
Using these settings:       
-matrix BLOSUM62 -evalue 0.01 -gapopen 11 -gapextend 1 - word_size 6      
This was run two times for each list of genes, one with outformat0 and one with outformat7.      
The results of this are saved here:    
/nobackup/data5/skeletonema_sex_project/blast_for_sex-genes/Sex-gene-list1/BLAST:        
flagellapart2_transcriptomehits_outfmt0.txt          
flagellapart2_transcriptomehits_outfmt7.txt        
flagellapart1_transcriptomehits_outfmt0.txt        
flagellapart1_transcriptomehits_outfmt7.txt          
meiosis_transcriptomehits_outfmt0.txt         
meiosis_transcriptomehits_outfmt7.txt           
           
####Blasting against swissprot

Next the five best contig hits for each gene (if available) was taken out from outformat7 and placed in a separate text file. This was done using the bash-script:           
/nobackup/data5/skeletonema_sex_project/blast_for_sex-genes/selectonly5best.sh            
All duplicated contigs were removed from the output from this script, using a simple: cat file.txt | uniq > newfile.txt      
This list of contigs was next used in a blastx search against the swissprot database, with the following settings:      
-db swissprot -evalue 0.01 -max_target_seqs 5 -word_size 6 -gapopen 11 -gapextend 1 -remote -matrix BLOSUM 62     

This was run twice:        
One time all 5 best contig hits for the meiosis genes were added to the 5 best contig hits from flagella-genes-part1.         
The results of this are saved here:        
/nobackup/data5/skeletonema_sex_project/blast_for_sex-genes/Sex-gene-list1/BLAST/allsexcontigs_meiosis+flagellapart1_againstswissprot_outfmt7 (or outfmt0).txt       

The second time was run for the 5 best contig hits for the flagella-genes-part2.           
The results of this are saved here:         
/nobackup/data5/skeletonema_sex_project/blast_for_sex-genes/Sex-gene-list1/BLAST/flagellapart2_contigsagainstswissprot_outfmt0.txt (or outfmt7)              

####Combining results into a table 

Finally these results, included if the contig was differentially expressed in time2 and 3 between experimental groups SMALL+CUE vs LARGE+CUE were all summarized in a table using a bash-script, located here:      
/nobackup/data5/skeletonema_sex_project/blast_for_sex-genes/createtablewithresults.sh         
The created table has the following organization:         
GENEID	GENEANNOTATION	Contighit1	Evalue	Bitscore	BestUniprothit	Evalue	Bitscore	DE2logF DE2Pvalue	DE3logF	DE3Pvalue Contig2...etc.            
And takes these as input:          
1: sexgenesids        
2: sexgenes_annotation       
3: sexgenes_alltranscriptomehits_outfmt7       
4: sexgenes_allswissprothits_outfmt7
5: DifferentialExpression_1       
6: DifferentialExpression_2

The resulting table was then analyzed manually for matches. With the criteria for a match being a very similar annotation in the swissprot hit, and an E-value of at least above 0.00001         
The resulting table can be found in the same folder here:      
/blast_for_sex_genes/table_with_sexgene-results_final.xlsx      


