###blast for sex genes

This directory holds the information from two sets of sex-related genes.
58 meiosis-related genes, and 126 genes mainly connected to flagella-function.     
These genes were looked for in the transcriptome, and the resulting contigs were investigated more in detail through a blastx search against the swissprot database.      
Finally the contigs were looked for in the list of differentially expressed contigs and all information was summarized into a table.     


####More details:

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

