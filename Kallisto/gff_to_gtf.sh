#!/bin/bash
#SBATCH -D /group/runciegrp/SharedResources/Genomes/Zea_mays/B73/AGPv4.36
#SBATCH -J GFF_to_GTF
#SBATCH -o /group/runciegrp/Projects/HiLo_ASE/Results/Kallisto/AGPv4/str_out/GFF_to_GTF_%_A.out
#SBATCH -e /group/runciegrp/Projects/HiLo_ASE/Results/Kallisto/AGPv4/str_err/GFF_to_GTF_%A.err
#SBATCH --mem 60G

module load cufflinks
gffread Zea_mays.AGPv4.36.gff3 -T -o Zea_mays.AGPv4.36.gtf
