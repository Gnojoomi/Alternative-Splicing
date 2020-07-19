#!/bin/bash
#SBATCH -D /group/runciegrp/Projects/HiLo_ASE/Results/Kallisto/AGPv4/counts
#SBATCH -J Kallisto_590
#SBATCH -o /group/runciegrp/Projects/HiLo_ASE/Results/Kallisto/AGPv4/str_out/%A_%a.out
#SBATCH -e /group/runciegrp/Projects/HiLo_ASE/Results/Kallisto/AGPv4/str_err/%A_%a.err
#SBATCH --mem 5G
#SBATCH --array=590

module load bio

index=/group/runciegrp/SharedResources/Genomes/Zea_mays/B73/AGPv4.36

directory=/group/runciegrp/Projects/HiLo_ASE/Results/Kallisto/AGPv4/counts/f17_P8_ILLSINHA14

kallisto quant -i $index/Zea_mays.AGPv4.cdna.all.kallisto.idx -o $directory -g $index/Zea_mays.AGPv4.36.gtf -t 4 -b 100 /group/runciegrp/Data/Illumina/reads/f17/rna/batch_2/f17_P8_ILLSINHA14_1.fq.gz /group/runciegrp/Data/Illumina/reads/f17/rna/batch_2/f17_P8_ILLSINHA14_2.fq.gz /group/runciegrp/Data/Illumina/reads/f17/rna/batch_4/18048-22-06-lane1/F17-P8-14_S408_L007_R1_001.fastq.gz /group/runciegrp/Data/Illumina/reads/f17/rna/batch_4/18048-22-06-lane1/F17-P8-14_S408_L007_R2_001.fastq.gz /group/runciegrp/Data/Illumina/reads/f17/rna/batch_4/18048-22-06-lane2/F17-P8-14_S408_L008_R1_001.fastq.gz /group/runciegrp/Data/Illumina/reads/f17/rna/batch_4/18048-22-06-lane2/F17-P8-14_S408_L008_R2_001.fastq.gz

