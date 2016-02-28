###Differential expression analysis

This directory holds the results and R-script for the differential expression analysis using all samples in the filtering of poorly expressed and dispersion estimation of contigs.     
Script: DE_S.marinoi_allsamples.R         

The results from this can be analysis can be found in /Results and /Results/sortedlogF.     
/Results:     
Holds all significantly DE contigs with less than 5% FDR, no particular logF threshold.     
/Results/sortedlogF:
Holds the same results but they are sorted on logF values, and files also exist with results with a threshold of logF 1 or -1.  

The comparisons in the DE were done between these experimental groups:       
Small+Cue vs Large+Cue (Time2) = Sex and Cellsize 2  
Small+Cue vs Large+Cue (Time3) = Sex and Cellsize 3
Large+Cue vs Large+NoCue (Time2) = Salt 2
Large+Cue vs Large+NoCue (Time3) = Salt 3
(Small+Cue vs Large+Cue (Time3)) vs (Small+Cue vs Large+Cue (Time2) ) = Sex and Cellsize, from 2 to 3.      






