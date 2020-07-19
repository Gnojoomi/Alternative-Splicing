
library(IsoformSwitchAnalyzeR)

Kallisto_quant <- importIsoformExpression(
    parentDir = "/group/runciegrp/Projects/HiLo_ASE/Results/Kallisto/counts/Sub_Sets/High_Field")

High<-read.csv("/home/gnojoomi/Aim_2/Alternative_Splice/sup_files/High_Field.csv",header=TRUE)
High<-High[match(colnames(Kallisto_quant$abundance)[-1],High$sampleID),]
colnames(High)<-c("sampleID","condition","condition")


High_SwitchList<-importRdata(isoformCountMatrix=Kallisto_quant$counts,isoformRepExpression=Kallisto_quant$abundance,designMatrix=High,isoformExonAnnoation="/group/runciegrp/SharedResources/Genomes/Zea_mays/B73/AGPv5.0/Zm-B73-REFERENCE-NAM-5.0_Zm00001e.1.gtf",isoformNtFasta="/group/runciegrp/SharedResources/Genomes/Zea_mays/B73/AGPv5.0/Zm-B73-REFERENCE-NAM-5.0_Zm00001e.1.cdna.fa.gz",showProgress=FALSE,ignoreAfterBar = TRUE,ignoreAfterSpace = TRUE,ignoreAfterPeriod = TRUE)

High_SwitchList_Filtered <- preFilter(
    switchAnalyzeRlist = High_SwitchList,
    geneExpressionCutoff = 5,
    isoformExpressionCutoff = 3,
    removeSingleIsoformGenes = TRUE
)
High_SwitchListAnalyzed <- isoformSwitchTestDEXSeq(
    switchAnalyzeRlist = High_SwitchList_Filtered,
    reduceToSwitchingGenes=TRUE
)
