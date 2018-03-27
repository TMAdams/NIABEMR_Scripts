#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -pe smp 12
#$ -l virtual_free=1G
#$ -l h=blacklace03.blacklace|blacklace04.blacklace|blacklace05.blacklace|blacklace06.blacklace|blacklace07.blacklace|blacklace08.blacklace|blacklace09.blacklace|blacklace10.blacklace

# Move to directory where copied files are
cd $1 || exit

# Specify location of reads and genome
Reference=$2
Reads=$3
Output=$4
# Copy genome to current location
cp $Reference .
cp $Reads .
# Make an index file needed for alignment
bwa index $Reference
# Run alignment and create a bam file
bwa mem -M -t 12 $Reference $Reads | samtools view -S -b - > "$Output"_unsorted.bam
# Sort bam file before indexing
samtools sort -@ 16  "$Output"_unsorted.bam -o "$Output".bam
# Create an index file needed to load into some viewers (eg. IGV)
samtools index "$Output".bam
# Remove files created during run
rm $Reference
rm "$Output"_unsorted.bam
