#!/bin/bash
#SBATCH -D /group/runciegrp/Projects/HiLo_ASE/Results/Kallisto/AGPv4/counts
#SBATCH -J Kallisto_quant
#SBATCH -o /group/runciegrp/Projects/HiLo_ASE/Results/Kallisto/AGPv4/str_out/%A_%a.out
#SBATCH -e /group/runciegrp/Projects/HiLo_ASE/Results/Kallisto/AGPv4/str_err/%A_%a.err
#SBATCH --mem 5G
#SBATCH --array=2-672

module load bio

sup_files=/group/runciegrp/Data/Illumina/metadata/f17_sample_submission_batch_1-4.csv
F1_sample_names=/home/gnojoomi/Aim_2/Alternative_Splice/sup_files/F1_file_names.csv
sample=$(sed -n ${SLURM_ARRAY_TASK_ID}p $F1_sample_names)
#echo "${SLURM_ARRAY_TASK_ID}p"


f_reads=$(grep $sample $sup_files | cut -d',' -f22,23 | sed 's/[,""]//g')
r_reads=$(grep $sample $sup_files | cut -d',' -f22,24 | sed 's/[,""]//g')

all_reads=$(paste <(echo "$f_reads") <(echo "$r_reads") --delimiters ' ' | tr '\r\n' ' ')
#echo $all_reads
index=/group/runciegrp/SharedResources/Genomes/Zea_mays/B73/AGPv4.36


directory=/group/runciegrp/Projects/HiLo_ASE/Results/Kallisto/AGPv4/counts/
sample=$(echo $sample | tr -d '"' | tr -d "'")
output_directory=$directory$sample
mkdir $output_directory

kallisto quant -i $index/Zea_mays.AGPv4.cdna.all.kallisto.idx -o $output_directory -g $index/Zea_mays.AGPv4.36.gtf -t 4 -b 100 $all_reads


