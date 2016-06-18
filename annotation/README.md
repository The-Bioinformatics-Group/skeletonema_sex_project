# Annotation

1. All transcripts in the file "skeletonema-marinoi_transcriptome_unannotated.fasta" was blasted (using BLASTx) to the RefSeq sequences in "Thalassiosira_pseudonana_RefSeq.fst" and "Phaeodactylum_tricornutum_RefSeq.fst", as described in the files "runBlast.1.sge" and "runBlast.2.sge".
2. First ("best") match was extracted using "firstHit.py" and stored in the files "Pt_best_hit.txt" and "Tp_best_hit.txt". 
3. The blast results was then merged with the DE-result files using [merge_files.py](https://github.com/mtop/misc/blob/master/merge_files.py) (first the Tp and then the Pt results).
