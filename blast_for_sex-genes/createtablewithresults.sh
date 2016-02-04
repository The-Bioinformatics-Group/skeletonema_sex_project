#!/bin/bash

if [ $1 = "-help" ];
then
	echo "This script will construct a table of different data"
	wait
	echo "Usage: "
	wait
	echo "./script.sh file-with-genenames/accessionnumber file-with-annotation-of-genes blastresults-outfmt7-againstranscriptome blastresults-outfmt7-reciprocal resultsofDE1 resultsofDE2"
else
	NUMGENES=$(wc -l $1 | cut -d" " -f1)
	NUM=0
	echo -e "GENEID\tANNOTATION\tCONTIG1\tEvalue\tBitscore\tUniprotHit\tAnnotation\tEvalue\tBitscore\tDE2logF\tDE2Pval\tDE3logF\tDE3Pval\tCONTIG2\tEvalue\tBitscore\tUniprotHit\tAnnotation\tEvalue\tBitscore\tDE2logF\tDE2Pval\tDE3logF\tDE3Pval\tCONTIG3\tEvalue\tBitscore\tUniprotHit\tAnnotation\tEvalue\tBitscore\tDE2logF\tDE2Pval\tDE3logF\tDE3Pval\tCONTIG4\tEvalue\tBitscore\tUniprotHit\tAnnotation\tEvalue\tBitscore\tDE2logF\tDE2Pval\tDE3logF\tDE3Pval\tCONTIG5\tEvalue\tBitscore\tUniprotHit\tAnnotation\tEvalue\tBitscore\tDE2logF\tDE2Pval\tDE3logF\tDE3Pval" > table_with_sexgene-results.txt
	for i in $(seq 1 $NUMGENES);
	do
	wait
	NUM=$(($NUM+1))
	wait
	GENEID=$(sed "${NUM}q;d" $1)
	ANNOTATION=$(sed "${NUM}q;d" $2 | sed 's/ /-/g')
	wait
	COUNTCHAR=$(echo "$GENEID" | sed 's/[^_]//g' | awk '{ print length }')
	wait
	ACCESSION=$(sed "${NUM}q;d" $1 | cut -d"_" -f-${COUNTCHAR})
	wait
	grep -e "$ACCESSION" $3 | grep -v "#" | cut -f2,11,12 > sexgene_contighits_TEMPORARY.txt
	CONTIGNUM=0
	for k in $(seq 1 5);
	do
	CONTIGNUM=$(($CONTIGNUM+1))
	wait
	CONTIGNAME=$(sed "${CONTIGNUM}q;d" sexgene_contighits_TEMPORARY.txt | cut -f1)
	wait
	if [ -z "$CONTIGNAME" ];
	then
                CONTIGNAME=$(echo "empty")
                CONTIGSTATS=$(echo -e "empty\tempty")
                BESTUNIPHIT=$(echo -e "empty\tempty\tempty\tempty")
                DE2=$(echo -e "empty\tempty")
                DE3=$(echo -e "empty\tempty")
	else
		CONTIGSTATS=$(sed "${CONTIGNUM}q;d" sexgene_contighits_TEMPORARY.txt | cut -f2,3)
		wait
		BESTUNIPHITNAME=$(grep -v "#" $4 | grep -m 1 -e "$CONTIGNAME" | cut -f2 | cut -d "|" -f5)
		wait
		if [ -z "$BESTUNIPHITNAME" ];
		then
			BESTUNIPHIT=$(echo -e "empty\tempty\tempty\tempty")
		else
			BESTUNIPHITSTATS=$(grep -v "#" $4 | grep -m 1 -e "$CONTIGNAME" | cut -f11,12)
			wait
			wget www.uniprot.org/uniprot/${BESTUNIPHITNAME}.fasta
			wait
			WORDLIMIT=$(grep -e "$BESTUNIPHITNAME" $BESTUNIPHITNAME.fasta | cut -d" " -f2- | cut -d"=" -f1 | wc -w)
			wait
			REMOVEWORD=$((${WORDLIMIT}-1))
			wait
			BESTUNIPHITANNO=$(grep -e "$BESTUNIPHITNAME" $BESTUNIPHITNAME.fasta | cut -d" " -f2- | cut -d"=" -f1 | cut -d" " -f-${REMOVEWORD} | sed 's/ /-/g')
			wait
			rm $BESTUNIPHITNAME.fasta
			wait
			BESTUNIPHIT=$(echo -e "${BESTUNIPHITNAME}\t${BESTUNIPHITANNO}\t${BESTUNIPHITSTATS}")
			wait
			DE2=$(grep -e "$CONTIGNAME" $5 | cut -f2,5)
			DE3=$(grep -e "$CONTIGNAME" $6 | cut -f2,5)
			wait
	        	if [ -z "$DE2" ];
        		then
                		DE2=$(echo -e "empty\tempty")
        		fi
        		if [ -z "$DE3" ];
        		then
                		DE3=$(echo -e "empty\tempty")
        		fi
		fi
	fi
	wait
	CONTIG[$k]="$(echo -e "${CONTIGNAME}\t${CONTIGSTATS}\t${BESTUNIPHIT}\t${DE2}\t${DE3}")"
	done
	CONTIGDE=$(echo -e "${CONTIG[1]}\t${CONTIG[2]}\t${CONTIG[3]}\t${CONTIG[4]}\t${CONTIG[5]}")
	wait
	GENEOUTPUT=$(echo -e "${GENEID}\t${ANNOTATION}\t${CONTIGDE}")
	wait
	echo "${GENEOUTPUT}" >> table_with_sexgene-results.txt
	wait
	rm sexgene_contighits_TEMPORARY.txt
	done
fi
