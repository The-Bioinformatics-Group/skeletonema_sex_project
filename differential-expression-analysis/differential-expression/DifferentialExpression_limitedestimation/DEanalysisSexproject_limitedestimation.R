library(edgeR)
library(locfit)
library(statmod)

countmatrix = read.table("matrix.counts.matrix", header = TRUE)
countmatrix_2 = countmatrix[,-c(3,4,8,9,10,11,12,13,14)]
countmatrix_3 = countmatrix[,-c(1,2,5,6,7,11,12,13,14)]
groups = read.table("samples.txt", header = TRUE)
groups_2 = groups[-c(3,4,8,9,10,11,12,13,14),]
groups_3 = groups[-c(1,2,5,6,7,11,12,13,14),]
Group_2 <- factor(paste(groups_2$cell.size,groups_2$cue.no.cue,groups_2$time,sep="."))
Group_3 <- factor(paste(groups_3$cell.size,groups_3$cue.no.cue,groups_3$time,sep="."))
cbind(groups_2,Group=Group)
cbind(groups_3,Group=Group)
design_2 <- model.matrix(~0+Group_2)
design_3 <- model.matrix(~0+Group_3)
y_2 <- DGEList(counts=countmatrix_2, group=Group)
y_3 <- DGEList(counts=countmatrix_3, group=Group)

#Filtering of poorly expressed genes. Most of my libsizes is greater than 10million readcounts. Meaning CPM = 1 = Around 10 reads. Lowest replicatenumber is 2.

keep_2 <- rowSums(cpm(y_2)>1) >= 2
keep_3 <- rowSums(cpm(y_3)>1) >= 2

#Remove all FALSE genes
y_2 <- y_2[keep_2, , keep.lib.sizes=FALSE]
y_3 <- y_3[keep_3, , keep.lib.sizes=FALSE]

#Normalize for lib.size
y_2 <- calcNormFactors(y_2)
y_3 <- calcNormFactors(y_3)

#Plot the relative similarities between the samples
pdf("MDSplot_2.pdf")
plotMDS(y_2)
dev.off()
pdf("MDSplot_3.pdf")
plotMDS(y_3)
dev.off()
#This shows that all experimental groups are more similar to eachother. Replicates cluster together.
#Changes rownames of design matrix from 1,2,3 etc, to sample names.
rownames(design_2) <- colnames (y_2)
rownames(design_3) <- colnames (y_3)

#Estimate genewise dispersion estimates over all genes allowing for a possible abundance trend.
#Tutorial online suggests using Cox-Reid, Adjusted Profile Likelihood estimation. Also tagwise is recommended for multifactoral experiments.Should also use glmQLFTest, and glmQLFit.
y_2 <- estimateDisp(y_2, design_2, robust=TRUE)
y_3 <- estimateDisp(y_3, design_3, robust=TRUE)
pdf("BCV_plot_2.pdf")
plotBCV(y_2)
dev.off()
pdf("BCV_plot_3.pdf")
plotBCV(y_3)
dev.off()

#After estimating dispersions I can fit the data to the model
fit_2 <- glmQLFit(y_2, design_2)
fit_3 <- glmQLFit(y_3, design_3)

pdf("QLDisp_plot_2.pdf")
plotQLDisp(fit_2)
dev.off()
pdf("QLDisp_plot_3.pdf")
plotQLDisp(fit_3)
dev.off()

#Then I can make contrasts between different groups. This compares the experimental groups, small+cue with large+cue within timepoint2 and 3 respectively. 

my.contrasts_2 <- makeContrasts(CS2vsCL2 = (Group_2small.cue.two-Group_2large.cue.two), levels=design_2)
my.contrasts_3 <- makeContrasts(CS3vsCL3 = (Group_3small.cue.three-Group_3large.cue.three), levels=design_3)

#Look for DE contigs due to sex and size in time 2 and 3, reporting all significantly DE contigs with less than 5% FDR. 
s2qlf <- glmQLFTest(fit_2, contrast=my.contrasts_2[,"CS2vsCL2"])
s3qlf <- glmQLFTest(fit_3, contrast=my.contrasts_3[,"CS3vsCL3"])

summary(dtS2 <- decideTestsDGE(s2qlf))
S2isDE <- as.logical(dtS2)
S2DEnames <- rownames(y_2)[S2isDE]
pdf("DEplotS2.pdf")
plotSmear(s2qlf, de.tags=S2DEnames)
abline(h=c(-1,1), col="blue")
dev.off()

summary(dtS3 <- decideTestsDGE(s3qlf))
S3isDE <- as.logical(dtS3)
S3DEnames <- rownames(y_3)[S3isDE]
pdf("DEplotS3.pdf")
plotSmear(s3qlf, de.tags=S3DEnames)
abline(h=c(-1,1), col="blue")
dev.off()

S2Sortedtags <- topTags(s2qlf, n=10000, sort.by="PValue")
S3Sortedtags <- topTags(s3qlf, n=10000, sort.by="PValue")

#Outputting table with the names of all significantly DE contigs with less than 5% FDR, as well as the first 10 000 contigs sorted based on Pvalue. 
write.table(S2DEnames, "DE_Contignames_2.ods", sep="\t")
write.table(S3DEnames, "DE_Contignames_3.ods", sep="\t")
write.table(S2Sortedtags, "DE_transcriptsS2_10000.ods", sep="\t")
write.table(S3Sortedtags, "DE_transcriptsS3_10000.ods", sep="\t")


