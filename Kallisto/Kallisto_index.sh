#!/bin/bash
#SBATCH -D /group/runciegrp/SharedResources/Genomes/Zea_mays/B73/AGPv4.36
#SBATCH -J Kallisto_Index
#SBATCH -o /group/runciegrp/Projects/HiLo_ASE/Results/Kallisto/AGPv4/str_out/Kallisto_index_%_A.out
#SBATCH -e /group/runciegrp/Projects/HiLo_ASE/Results/Kallisto/AGPv4/str_err/Kallisto_index_%A.err
#SBATCH --mem 60G

module load bio

kallisto index -i Zea_mays.AGPv4.cdna.all.kallisto.idx -k 31 /group/runciegrp/SharedResources/Genomes/Zea_mays/B73/AGPv4.36/Zea_mays.AGPv4.cdna.all.fa
