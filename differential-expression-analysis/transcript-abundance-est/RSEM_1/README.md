###Transcript abundance estimation

This directory holds the results from the read-mapping and resolution of multi-mapped reads for each sample.      
This was done using the script:      
/usr/local/bin/trinityrnaseq_r20140717/util/align_and_estimate_abundance.pl      
With the following settings:        
--single $DATA/$RNAFILE --seqType fq --transcripts $ASSEMBLY --est_method RSEM --aln_method bowtie2 --output_dir $OUTPUT/sample${NUM} --thread_count 10 --fragment_length 51 --include_rsem_bam       
Where every input file is another sample with single-end data and the results are outputted into a separate file with the same sample-name.          


