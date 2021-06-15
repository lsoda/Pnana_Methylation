library(tidyverse)
library(caret)
library(GGally)
library(treemap)

setwd("D:/Lab/OA/Pn_OA/Nextdenovo_GLM/repeat")

## CpG Ratio Graph
#TE
rp<-read.table('./repeat_mmm_updown.txt', header = T, sep = '\t')
head(rp)
ggplot(rp, aes(x = CpG, y = Generation)) + ggridges::geom_density_ridges() + scale_x_continuous()

con <- rp[rp$Treatment == "Control",]

png(filename="TE_total_CpG.png",width=15,height=10,unit="cm", res=600, bg="white")
p <- ggplot(rp, aes(x = Each, y= CpG, color=Treatment, fill=Treatment)) +
  geom_violin(trim=FALSE,alpha=.3, adjust= .5, fill="white") + 
  geom_boxplot(width=.1, outlier.colour=NA, show_guide=FALSE) +
  stat_summary(fun.y=median, geom="point", fill="white", shape=21, size=2.5, show_guide=FALSE) + 
  theme_classic() +
  geom_hline(yintercept=median(con$CpG), linetype='dashed', size = .5, color = 'red') +
  scale_x_discrete(limits=c("F0N-Control", "F0O-Hyper", "F1O-Hyper", "F2O-Hyper", "F0O-Hypo", "F1O-Hypo", "F2O-Hypo"))
p
dev.off()

#TE - Gypsy
rp2<-read.table('./repeat_mmm_updown_gypsy.txt', header = T, sep = '\t')
head(rp2)

con <- rp2[rp2$Treatment == "Control",]

png(filename="TE_gypsy_CpG.png",width=15,height=10,unit="cm", res=600, bg="white")
p <- ggplot(rp2, aes(x = Each, y= CpG, color=Treatment, fill=Treatment)) +
  geom_violin(trim=FALSE,alpha=.3, adjust= .5, fill="white") + 
  geom_boxplot(width=.1, outlier.colour=NA, show_guide=FALSE) +
  stat_summary(fun.y=median, geom="point", fill="white", shape=21, size=2.5, show_guide=FALSE) + 
  theme_classic() +
  geom_hline(yintercept=median(con$CpG), linetype='dashed', size = .5, color = 'red') +
  scale_x_discrete(limits=c("F0N-Control", "F0O-Hyper", "F1O-Hyper", "F2O-Hyper", "F0O-Hypo", "F1O-Hypo", "F2O-Hypo"))
p
dev.off()

#TE - Pao
rp3<-read.table('./repeat_mmm_updown_copia.txt', header = T, sep = '\t')
head(rp3)

con <- rp3[rp3$Treatment == "Control",]

png(filename="TE_copia_CpG.png",width=15,height=10,unit="cm", res=600, bg="white")
p <- ggplot(rp3, aes(x = Each, y= CpG, color=Treatment, fill=Treatment)) +
  geom_violin(trim=FALSE,alpha=.3, adjust= .7, fill="white") + 
  geom_boxplot(width=.1, outlier.colour=NA, show_guide=FALSE) +
  stat_summary(fun.y=median, geom="point", fill="white", shape=21, size=2.5, show_guide=FALSE) + 
  theme_classic() +
  geom_hline(yintercept=median(con$CpG), linetype='dashed', size = .5, color = 'red') +
  scale_x_discrete(limits=c("F0N-Control", "F0O-Hyper", "F1O-Hyper", "F2O-Hyper", "F0O-Hypo", "F1O-Hypo", "F2O-Hypo"))
p
dev.off()
