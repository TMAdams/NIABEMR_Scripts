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
screen -a

qlogin -pe smp 12 -l virtual_free=1G

cd Gridion_check_HB

Reference=/home/sobczm/popgen/rnaseq/fvesca_v1.1_all.fa
Reads=RG_Gridion_Top40.fastq.gz
cp $Reference .
bwa index $Reference
bwa mem -M -t 12 $Reference $Reads | samtools view -S -b - > Aligned_Reads.bam
samtools index Aligned_Reads.bam
rm $Reference
```
