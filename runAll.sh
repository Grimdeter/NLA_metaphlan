#!/bin/bash

dirArr=("CK23" "CK25"  "CK28"  "CK30"  "CK34"  "CN02"  "CN04"  "CN06"  "CN11"  "CN12"  "CN18"  "CN46")

dir="/home/grim/cnckrun/X101SC21101085-Z01-F007_01"

shopt -s nullglob

for ((i=0; i<=${#dirArr[@]}-1; i++))
do
	echo ${dirArr[i]}
	for f in $dir/${dirArr[i]}/*; do
		if [ -e $f.bowtie2out.txt ]
		then
			metaphlan $f.bowtie2out.txt --input_type bowtie2out -o $f.txt
			echo "bowtie used"
		else
			metaphlan $f --input_type fastq -o $f.txt
			echo "fastq used"
		fi
		echo "done $f"
	done
	echo "done $i of ${#dirArr[@]}-1"
done

echo "all done!"
