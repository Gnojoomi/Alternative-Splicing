#!/bin/bash
#SBATCH -D /group/runciegrp/Projects/HiLo_ASE/Results/Kallisto/AGPv4/counts
#SBATCH -J Kallisto_643
#SBATCH -o /group/runciegrp/Projects/HiLo_ASE/Results/Kallisto/AGPv4/str_out/%A_%a.out
#SBATCH -e /group/runciegrp/Projects/HiLo_ASE/Results/Kallisto/AGPv4/str_err/%A_%a.err
#SBATCH --mem 5G
#SBATCH --array=643

module load bio


index=/group/runciegrp/SharedResources/Genomes/Zea_mays/B73/AGPv4.36

directory=/group/runciegrp/Projects/HiLo_ASE/Results/Kallisto/AGPv4/counts/f17_P8_ILLSINHA67

kallisto quant -i $index/Zea_mays.AGPv4.cdna.all.kallisto.idx -o $directory -g $index/Zea_mays.AGPv4.36.gtf /group/runciegrp/Data/Illumina/reads/f17/rna/batch_2/f17_P8_ILLSINHA67_1.fq.gz /group/runciegrp/Data/Illumina/reads/f17/rna/batch_2/f17_P8_ILLSINHA67_2.fq.gz /group/runciegrp/Data/Illumina/reads/f17/rna/batch_4/18048-22-06-lane1/F17-P8-67_S461_L007_R1_001.fastq.gz /group/runciegrp/Data/Illumina/reads/f17/rna/batch_4/18048-22-06-lane1/F17-P8-67_S461_L007_R2_001.fastq.gz /group/runciegrp/Data/Illumina/reads/f17/rna/batch_4/18048-22-06-lane2/F17-P8-67_S461_L008_R1_001.fastq.gz /group/runciegrp/Data/Illumina/reads/f17/rna/batch_4/18048-22-06-lane2/F17-P8-67_S461_L008_R2_001.fastq.gz


