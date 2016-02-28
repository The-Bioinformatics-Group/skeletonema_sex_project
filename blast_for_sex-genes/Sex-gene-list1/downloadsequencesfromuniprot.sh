#!/bin/bash

NUMLINES=$(wc -l $1 | cut -d" " -f1)
NUM=0
for i in $(seq 1 $NUMLINES);
do
NUM=$(($NUM+1))
wait
UNIID=$(sed "${NUM}q;d" $1)
wait
wget http://www.uniprot.org/uniprot/${UNIID}.fasta >> stdoutwget.txt
wait
cat $UNIID.fasta >> flagella_seq.fasta
wait
grep -e">" $UNIID.fasta | cut -d "|" -f3 | cut -d" " -f1 >> flagella_allIDS_newnamesfromuniprot.txt
wait
grep -e">" $UNIID.fasta | cut -d " " -f2- >> flagellaproteinannotation.txt
wait
rm $UNIID.fasta
done

