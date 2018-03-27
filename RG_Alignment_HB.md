# Align a small number of ONT reads to Fv assembly as sanity check

## Copy file of sample reads onto cluster

Sample reads were taken as largest 40 in file using Geneious

```bash
# Run from local machine - Mac OSX 10.13.3

scp /Users/adamst/Desktop/RG_Gridion_Top40.fastq.gz \
adamst@149.155.34.72:/home/adamst/Gridion_check_HB/.
```

## Align reads using BWA-mem

```bash
# Use a screen session to persist after logout
screen -a

# Run on any except blacklace01 or blacklace11
qlogin -pe smp 12 -l virtual_free=1G

# Move to directory where copied files are
cd Gridion_check_HB

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
```
