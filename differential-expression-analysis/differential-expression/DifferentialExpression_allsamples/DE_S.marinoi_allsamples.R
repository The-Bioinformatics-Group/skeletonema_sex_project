library(edgeR)
library(locfit)
library(statmod)
countmatrix = read.table("matrix.counts.matrix", header = TRUE)
groups = read.table("samples.txt", header = TRUE)
Group <- factor(paste(groups$cell.size,groups$cue.no.cue,groups$time,sep="."))
cbind(groups,Group=Group)

design <- model.matrix(~0+Group)
y <- DGEList(counts=countmatrix, group=Group)

#Filtering of poorly expressed genes. Most of my libsizes is greater than 10million readcounts. Meaning CPM = 1 = Around 10 reads. Lowest replicatenumber is 2.

keep <- rowSums(cpm(y)>1) >= 2

#Results: FALSE 9632, TRUE 30018
#Remove all FALSe genes
y <- y[keep, , keep.lib.sizes=FALSE]

#Normalize for lib.size
y <- calcNormFactors(y)

#Plot the relative similarities between the fourteen samples
#pdf("MDSplot.pdf")
#plotMDS(y)
#dev.off()
#This shows that all experimental groups are more similar to eachother. Replicates cluster together.

#Changes rownames of design matrix from 1,2,3 etc, to sample names
rownames(design) <- colnames (y)

#Estimate genewise dispersion estimates over all genes allowing for a possible abundance trend.
#Tutorial online suggests using Cox-Reid, Adjusted Profile Likelihood estimation. Also tagwise is recommended for multifactoral experiments.Should also use glmQLFTest, and glmQLFit.

y <- estimateDisp(y, design, robust=TRUE)

#pdf("BCV_plot.pdf")
#plotBCV(y)
#dev.off()
#pdf("QLDisp_plot.pdf")
#plotQLDisp(fit)
#dev.off()
#After estimating dispersions I can fit the data to the model

fit <- glmQLFit(y, design)

#Then I can make contrasts between different groups and save the results
#SmallCue vs Largecue = Small + Sex
#(LargeCue2 vs SmallCue2) vs (LargeCue3 vs SmallCue3) = Difference between 2 and 3.
#DE will be both for size and sex.

my.contrasts <- makeContrasts(CS2vsCL2 = (Groupsmall.cue.two-Grouplarge.cue.two), CS3vsCL3 = (Groupsmall.cue.three-Grouplarge.cue.three),CS2.CL2vsCS3.CL3 = ((Groupsmall.cue.two-Grouplarge.cue.two)-(Groupsmall.cue.three-Grouplarge.cue.three)), CS3.CL3vsCS2.CL2 = ((Groupsmall.cue.three-Grouplarge.cue.three)-(Groupsmall.cue.two-Grouplarge.cue.two)), Salt2 = (Grouplarge.cue.two-Grouplarge.nocue.two), Salt3 = (Grouplarge.cue.three-Grouplarge.nocue.three), levels=design)

#Look for DE genes due to sex and size in time 2 and 3, and between 2 and 3, and 3 and 2.
#s2qlf <- glmQLFTest(fit, contrast=my.contrasts[,"CS2vsCL2"])
#s3qlf <- glmQLFTest(fit, contrast=my.contrasts[,"CS3vsCL3"])
#s2v3qlf <- glmQLFTest(fit, contrast=my.contrasts[,"CS2.CL2vsCS3.CL3"])
#s3v2qlf <- glmQLFTest(fit, contrast=my.contrasts[,"CS3.CL3vsCS2.CL2"])
s2saltqlf <- glmQLFTest(fit, contrast=my.contrasts[,"Salt2"])
s3saltqlf <- glmQLFTest(fit, contrast=my.contrasts[,"Salt3"])

#summary(dtS2 <- decideTestsDGE(s2qlf))
#S2isDE <- as.logical(dtS2)
#S2DEnames <- rownames(y)[S2isDE]
#pdf("DEplotS2.pdf")
#plotSmear(s2qlf, de.tags=S2DEnames)
#abline(h=c(-1,1), col="blue")
#dev.off()

#summary(dtS3 <- decideTestsDGE(s3qlf))
#S3isDE <- as.logical(dtS3)
#S3DEnames <- rownames(y)[S3isDE]
#pdf("DEplotS3.pdf")
#plotSmear(s3qlf, de.tags=S3DEnames)
#abline(h=c(-1,1), col="blue")
#dev.off()

#summary(dtS2V3 <- decideTestsDGE(s2v3qlf))
#S2V3isDE <- as.logical(dtS2V3)
#S2V3DEnames <- rownames(y)[S2V3isDE]
#pdf("DEplotS2V3.pdf")
#plotSmear(s2v3qlf, de.tags=S2V3DEnames)
#abline(h=c(-1,1), col="blue")
#dev.off()

#summary(dtS3V2 <- decideTestsDGE(s3v2qlf))
#S3V2isDE <- as.logical(dtS3V2)
#S3V2DEnames <- rownames(y)[S3V2isDE]
#pdf("DEplotS3V2.pdf")
#plotSmear(s3v2qlf, de.tags=S3V2DEnames)
#abline(h=c(-1,1), col="blue")
#dev.off()

summary(dtS2salt <- decideTestsDGE(s2saltqlf))
S2salt <- as.logical(dtS2salt)
S2saltnames <- rownames(y)[S2salt]

summary(dtS3salt <- decideTestsDGE(s3saltqlf))
S3salt <- as.logical(dtS3salt)
S3saltnames <- rownames(y)[S3salt]

#S2Sortedtags <- topTags(s2qlf, n=10000, sort.by="PValue")
#S3Sortedtags <- topTags(s3qlf, n=10000, sort.by="PValue")
#S2V3Sortedtags <- topTags(s2v3qlf, n=10000, sort.by="PValue")
#S3V2Sortedtags <- topTags(s3v2qlf, n=10000, sort.by="PValue")
S2saltSortedtags <- topTags(s2saltqlf, n=10000, sort.by="PValue")
S3saltSortedtags <- topTags(s3saltqlf, n=10000, sort.by="PValue")

#Write table of 10000 contigs sorted on Pvalue
#write.table(S2Sortedtags, "DE_transcriptsS2.ods", sep="\t")
#write.table(S3Sortedtags, "DE_transcriptsS3.ods", sep="\t")
#write.table(S2V3Sortedtags, "DE_transcriptsS2V3.ods", sep="\t")
#write.table(S3V2Sortedtags, "DE_transcriptsS3V2.ods", sep="\t")
write.table(S2saltSortedtags, "DE_transcriptsS2salt.ods", sep="\t")
write.table(S3saltSortedtags, "DE_transcriptsS3salt.ods", sep="\t")
#Write table of name of all DE contigs
#write.table(S2DEnames, "DE2_names.txt", sep="\t")
#write.table(S3DEnames, "DE3_names.txt", sep="\t")
#write.table(S2V3DEnames, "DE2v3_names.txt", sep="\t")
#write.table(S3V2DEnames, "DE3v2_names.txt", sep="\t")
write.table(S2saltnames, "DE2salt_names.txt", sep="\t")
write.table(S3saltnames, "DE3salt_names.txt", sep="\t")


