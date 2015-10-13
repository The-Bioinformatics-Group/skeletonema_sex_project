##This folder contains bash-scripts for running Detonate on Transcriptome-assemblies

####What is detonate?

DETONATE (DE novo TranscriptOme rNa-seq Assembly with or without the Truth Evaluation) consists of two component packages, RSEM-EVAL and REF-EVAL. Both packages are mainly intended to be used to evaluate de novo transcriptome assemblies, although REF-EVAL can be used to compare sets of any kinds of genomic sequences.  

RSEM-EVAL is a reference-free evaluation method based on a novel probabilistic model that depends only on an assembly and the RNA-Seq reads used for its construction. Unlike N50, RSEM-EVAL combines multiple factors, including the compactness of an assembly and the support of the assembly from the RNA-Seq data, into a single, statistically-principled evaluation score. This score can be used to select a best assembler, optimize an assembler's parameters, and guide new assembler design as an objective function. In addition, for each contig within an assembly, RSEM-EVAL provides a score that assesses how well that contig is supported by the RNA-Seq data and can be used to filter unnecessary contigs.  

REF-EVAL is a toolkit of reference-based measures, including contig, nucleotide, and pair precision, recall, and F1 scores, a novel kmer compression score, and several scores that compare induced kmer distributions between the assembly and the reference. REF-EVAL also includes a program to estimate the “true” assembly of a set of RNA-Seq reads, relative to a collection of full-length reference transcripts.  

###Scripts


