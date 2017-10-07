
# code mostly not written by me, except loops at the end
# modified to produce image files for data viz movie by Ming-Dao Chia

library(SNPRelate)
library(tidyverse)

geno = snpgdsOpen("data/bdis.gds", allow.duplicate = T)

geno.names = snpgdsSummary(geno)

sample.data = data.frame(sample.id = geno.names$sample.id)

gn = snpgdsGetGeno(geno, snp.id = seq(1, 500000, 50))
rownames(gn) = sample.data$sample.id

sample.data$miss.rate = snpgdsSampMissRate(geno, sample.id=sample.data$sample)

sample.data = sample.data %>%
  filter(miss.rate < 0.2)   

snp.summary.plt = snpgdsSNPRateFreq(geno, sample.id=sample.data$sample) %>%
  as.data.frame() %>%
  gather("measure", "freq")

minimum.maf = 0.01 # exclude rarest 1% of minor alleles
maximum.missing.rate = 0.5 # exclude if 50% of SNPs missing

ibs = snpgdsIBS(geno, maf=minimum.maf, missing.rate=maximum.missing.rate,
                sample.id=sample.data$sample)

sample.data$group = tree$samp.group

sample.data.no.outlier = sample.data %>% 
  filter(group!='Outlier001')
table(sample.data.no.outlier$group)

ibs = snpgdsIBS(geno, maf=minimum.maf, missing.rate=maximum.missing.rate,
                sample.id=sample.data.no.outlier$sample)

for(i in 1:50){
tree = snpgdsHCluster(ibs) %>%
  snpgdsCutTree(z.threshold = i)
file_name = paste('treez_',i,'.jpeg', sep='')
jpeg(filename=file_name, width = 720, height = 480)
title = paste('z.threshold=',i)
treepic = snpgdsDrawTree(tree, main=title)
dev.off()
}

# to actually make the movie, run this command: 
# ffmpeg -r 3 -i treez_%d.jpeg -r 3 -vcodec mpeg4 -qscale:v 1 movie.mp4

