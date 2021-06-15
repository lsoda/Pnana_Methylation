library(pheatmap); library(gplots)
library(ggplot2)
library(reshape2)
library(plyr)

getwd()
setwd('D://Lab//OA//Pn_OA//Nextdenovo_RNASeq//Vis')

cano = read.table('./heatmap_histone_related.txt', sep = '\t', check.names=FALSE, 
                          header = T, quote = '', fill = T, row.names = 1)
head(cano)

rownames(cano)
colnames(cano)
newnames <- lapply(
  rownames(cano),
  function(x) bquote(italic(.(x))))


library(extrafont)
library(tidyverse)
library(showtext)

font_import()
loadfonts(device="win") 

png(filename="histone_heatmap2.png",width=30,height=40,unit="cm", res=600, bg="white")
pheatmap(cano,
         scale             = 'column',
         color             = bluered(255),
         clustering_method = 'ward.D', ## JH : updated
         cellwidth         = 45,
         fontsize_col      = 25,
         fontsize_row      = 25,
         show_rownames     = T,
         labels_row        = as.expression(newnames),
         treeheight_row    = 70,
         cutree_rows       = 5,
         treeheight_col    = 5,
         angle_col         = 0)

dev.off()
