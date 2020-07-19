#!/bin/bash
#SBATCH -D /group/runciegrp/Projects/HiLo_ASE/Results/Kallisto/counts/Sub_Sets
#SBATCH -J High_Low_Directories
#SBATCH -o /home/gnojoomi/Alternative_Splice/scripts/Alternative_analysis/%_A.out
#SBATCH -e /home/gnojoomi/Alternative_Splice/scripts/Alternative_analysis/%A.err
#SBATCH --mem 5G

High="/home/gnojoomi/Alternative_Splice/sup_files/High_Field.csv"
Low="/home/gnojoomi/Alternative_Splice/sup_files/Low_Field.csv"
Files="/group/runciegrp/Projects/HiLo_ASE/Results/Kallisto/counts/boot_strapped_100/"

High_names=$(cut -d"," -f22 $High)
Low_names=$(cut -d"," -f22 $Low)

High_Destination="/group/runciegrp/Projects/HiLo_ASE/Results/Kallisto/counts/Sub_Sets/High_Field"
Low_Destination="/group/runciegrp/Projects/HiLo_ASE/Results/Kallisto/counts/Sub_Sets/Low_Field"

for i in $Low_names
do
        temp="${i%\"}" #remove front quotes
	temp="${temp#\"}" #remove quotes 
	Path_Files=$Files$temp
	#echo $Path_Files
	echo $temp
	cp -r $Path_Files $Low_Destination
done 

