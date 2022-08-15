library(tidyverse)
library(caret)
library(GGally)
library(treemap)

setwd("D:\Lab\OA\Pn_OA\Nextdenovo_GLM\repeat")
## GLM ratio
# Total
rp<-read.table('./diff_repeat_plot.txt', header = T, sep = '\t')
head(rp)
ggplot(rp, aes(x = Ratio, y = Generation)) + ggridges::geom_density_ridges() + scale_x_continuous()

png(filename="GLM_total.png",width=8,height=10,unit="cm", res=600, bg="white")
p <- ggplot(rp, aes(x = Generation, y= log(Ratio), color = Generation, fill=Generation)) +
  geom_violin(trim=FALSE,alpha=.3, adjust= .7) + 
  geom_boxplot(width=.1, fill= "black", outlier.colour=NA, show_guide=FALSE) +
  stat_summary(fun.y=median, geom="point", fill="white", shape=21, size=2.5, show_guide=FALSE) + 
  theme_classic() +
  geom_hline(yintercept=0, linetype='dashed', size = .5, color = 'red')
p
dev.off()

# Gypsy
rp2 <- read.table('./diff_repeat_plot_gypsy.txt', header = T, sep = '\t')
head(rp2)

png(filename="GLM_gypsy.png",width=8,height=10,unit="cm", res=600, bg="white")
p <- ggplot(rp2, aes(x = Generation, y= log(Ratio), color = Generation, fill=Generation)) +
  geom_violin(trim=FALSE,alpha=.3, adjust= 1) + 
  geom_boxplot(width=.1, fill= "black", outlier.colour=NA, show_guide=FALSE) +
  stat_summary(fun.y=median, geom="point", fill="white", shape=21, size=2.5, show_guide=FALSE) + 
  theme_classic() +
  geom_hline(yintercept=0, linetype='dashed', size = .5, color = 'red')
p
dev.off()

# Pao
rp3 <-read.table('./diff_repeat_plot_pao.txt', header = T, sep = '\t')
head(rp3)

png(filename="GLM_Pao.png",width=8,height=10,unit="cm", res=600, bg="white")
p <- ggplot(rp3, aes(x = Generation, y= log(Ratio), color = Generation, fill=Generation)) +
  geom_violin(trim=FALSE,alpha=.3, adjust= 1) + 
  geom_boxplot(width=.1, fill= "black", outlier.colour=NA, show_guide=FALSE) +
  stat_summary(fun.y=median, geom="point", fill="white", shape=21, size=2.5, show_guide=FALSE) + 
  theme_classic() +
  geom_hline(yintercept=0, linetype='dashed', size = .5, color = 'red')
p
dev.off()





