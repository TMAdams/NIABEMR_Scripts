#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -pe smp 12
#$ -l virtual_free=1G
#$ -l h=blacklace03.blacklace|blacklace04.blacklace|blacklace05.blacklace|blacklace06.blacklace|blacklace07.blacklace|blacklace08.blacklace|blacklace09.blacklace|blacklace10.blacklace

# Move to directory where copied files are
cd Gridion_check_HB || exit

# Specify location of reads and genome
Reference=/home/sobczm/popgen/rnaseq/fvesca_v1.1_all.fa
Reads=RG_Gridion_Top40.fastq.gz
# Copy genome to current location
cp $Reference .
# Make an index file needed for alignment
bwa index $Reference
# Run alignment and create a bam file
bwa mem -M -t 12 $Reference $Reads | samtools view -S -b - > Aligned_Reads.bam
# Create an index file needed to load into some viewers (eg. IGV)
samtools index Aligned_Reads.bam
# Remove files created during run
rm $Reference
