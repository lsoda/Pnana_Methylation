library("ggplot2")
library("pheatmap")
library(extrafont)
library(RColorBrewer)

setwd("D:/Lab/OA/Pn_OA/Nextdenovo_GLM/go")

tb <- read.csv("IPA_canonical_DMG.txt", sep = '\t', header = T)
tb

go <- tb$Canonical.Pathway
tb <- tb[,-1]
tb

rownames(tb)<-tb$Canonical.Pathway
png(filename="HEATMAP_scalebar.jpg", height = 15, width = 20, units = "cm", res = 1000)
palen <- 6
myColor <- colorRampPalette(c(RColorBrewer::brewer.pal(6,"Reds")))(palen)
out<-pheatmap(tb[2:4], color = myColor, breaks = c(0, 0.5, 1, 1.5, 2, 2.5, 3), border_color = NA, cluster_cols = F, na_col = "white", show_rownames = T, show_colnames = F)
out
dev.off()

png(filename="tree.png", height = 20, width = 20, units = "cm", res = 1000)
rownames(data[out$tree_row[["order"]],])
sort(cutree(out$tree_row, k=3))
sort(cutree(out$tree_row, k=4))
plot(out$tree_row)
abline(h=7, col="red", lty=2, lwd=2)
dev.off()

