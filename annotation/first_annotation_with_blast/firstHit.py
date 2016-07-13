#!/bin/env python

import sys

file1 = open(sys.argv[1], "r")

def parse_file(inputFile1):
	dict1 = {}
	
	# Parse the input file
	for line in inputFile1.readlines():
		if line.split()[0] not in dict1:
			dict1[line.split()[0]] = line.rsplit()
		else:
			pass
	
	for key, value in dict1.iteritems():
	#	print key, str(value).replace("'", "").replace(",", "").replace("[", "").replace("]", "").replace(" ", "\t")
		print str(value).replace("'", "").replace(",", "").replace("[", "").replace("]", "").replace(" ", "\t")

if __name__ == "__main__":
	parse_file(file1)

