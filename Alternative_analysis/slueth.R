library(sleuth)
library(data.table)
library(plyr)
base_dir<-"/group/runciegrp/Projects/HiLo_ASE/Results/Kallisto/counts/boot_strapped_100"
sample_names='/home/gnojoomi/Alternative_Splice/sup_files/F1s_Samples_no_mag.txt'
metadata_dir<-'/home/gnojoomi/Alternative_Splice/sup_files'
names <- fread(sample_names, select=c(1),header=FALSE)
kal_dirs<-sapply(names,function(id) file.path(base_dir,id))
s2c <- read.table(file.path(metadata_dir, "F1_metadata.csv"), header = TRUE, stringsAsFactors=FALSE)

