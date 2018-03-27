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
# Set variables for submitting script
Reference=/home/sobczm/popgen/rnaseq/fvesca_v1.1_all.fa
Reads=RG_Gridion_Top40.fastq.gz
Output=Aligned_Reads
# Place job into submission queue to be run when space available
qsub Bwa_Single_File $PWD $Reference $Reads $Output
```
