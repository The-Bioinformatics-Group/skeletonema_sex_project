#!/bin/bash

NUMLINES=$(wc -l meiosisgeneassonum.txt | cut -d" " -f1)
NUM=0
for i in $(seq 1 $NUMLINES);
do
NUM=$(($NUM+1))
wait
UNIID=$(sed "${NUM}q;d" meiosisgeneassonum.txt)
wait
grep -e "${UNIID}" blastresults_outfmt7_58meiosisgenes.txt | grep -v "#" > hits_tempfile.txt
wait
NUM2=0
for i in $(seq 1 5);
do
NUM2=$(($NUM2+1))
wait
sed "${NUM2}q;d" hits_tempfile.txt >> meiosisgenes_5besttranscriptomehits.txt
wait
done
rm hits_tempfile.txt
done

