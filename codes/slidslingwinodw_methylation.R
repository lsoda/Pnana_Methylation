library(dplyr)
library(gplots)
library(ggplot2)
library(gridExtra)
library(grid)

setwd("D:/Lab/OA/Pn_OA/revision/cor/compare/sw_gbm")
getwd()

datrawF0N <- read.csv("F0N.sw", sep="\t", header=F)
colnames(datrawF0N) <- c("contig", "start","end", "meth")
a<-apply(datrawF0N[,2:3], 1, mean)
datF0N <- cbind(datrawF0N,a)
F0N_d5<- subset(datF0N, contig == 'Pn_05')

datrawF0M <- read.csv("F0M.sw", sep="\t", header=F)
colnames(datrawF0M) <- c("contig", "start","end", "meth")
a<-apply(datrawF0M[,2:3], 1, mean)
datF0M <- cbind(datrawF0M,a)
F0M_d5<- subset(datF0M, contig == 'Pn_05')

datrawF1M <- read.csv("F1M.sw", sep="\t", header=F)
colnames(datrawF1M) <- c("contig", "start","end", "meth")
a<-apply(datrawF1M[,2:3], 1, mean)
datF1M <- cbind(datrawF1M,a)
F1M_d5<- subset(datF1M, contig == 'Pn_05')

datrawF2M <- read.csv("F2M.sw", sep="\t", header=F)
colnames(datrawF2M) <- c("contig", "start","end", "meth")
a<-apply(datrawF2M[,2:3], 1, mean)
datF2M <- cbind(datrawF2M,a)
F2M_d5<- subset(datF2M, contig == 'Pn_05')

datrawF0N <- read.csv("../sw_total/F0N.sw", sep="\t", header=F)
colnames(datrawF0N) <- c("contig", "start","end", "meth")
a<-apply(datrawF0N[,2:3], 1, mean)
datF0N <- cbind(datrawF0N,a)
tF0N_d5<- subset(datF0N, contig == 'Pn_05')

datrawF0M <- read.csv("../sw_total/F0M.sw", sep="\t", header=F)
colnames(datrawF0M) <- c("contig", "start","end", "meth")
a<-apply(datrawF0M[,2:3], 1, mean)
datF0M <- cbind(datrawF0M,a)
tF0M_d5<- subset(datF0M, contig == 'Pn_05')

datrawF1M <- read.csv("../sw_total/F1M.sw", sep="\t", header=F)
colnames(datrawF1M) <- c("contig", "start","end", "meth")
a<-apply(datrawF1M[,2:3], 1, mean)
datF1M <- cbind(datrawF1M,a)
tF1M_d5<- subset(datF1M, contig == 'Pn_05')

datrawF2M <- read.csv("../sw_total/F2M.sw", sep="\t", header=F)
colnames(datrawF2M) <- c("contig", "start","end", "meth")
a<-apply(datrawF2M[,2:3], 1, mean)
datF2M <- cbind(datrawF2M,a)
tF2M_d5<- subset(datF2M, contig == 'Pn_05')

datrawF0N <- read.csv("../sw_exon/F0N.sw", sep="\t", header=F)
colnames(datrawF0N) <- c("contig", "start","end", "meth")
a<-apply(datrawF0N[,2:3], 1, mean)
datF0N <- cbind(datrawF0N,a)
eF0N_d5<- subset(datF0N, contig == 'Pn_05')

datrawF0M <- read.csv("../sw_exon/F0M.sw", sep="\t", header=F)
colnames(datrawF0M) <- c("contig", "start","end", "meth")
a<-apply(datrawF0M[,2:3], 1, mean)
datF0M <- cbind(datrawF0M,a)
eF0M_d5<- subset(datF0M, contig == 'Pn_05')

datrawF1M <- read.csv("../sw_exon/F1M.sw", sep="\t", header=F)
colnames(datrawF1M) <- c("contig", "start","end", "meth")
a<-apply(datrawF1M[,2:3], 1, mean)
datF1M <- cbind(datrawF1M,a)
eF1M_d5<- subset(datF1M, contig == 'Pn_05')

datrawF2M <- read.csv("../sw_exon/F2M.sw", sep="\t", header=F)
colnames(datrawF2M) <- c("contig", "start","end", "meth")
a<-apply(datrawF2M[,2:3], 1, mean)
datF2M <- cbind(datrawF2M,a)
eF2M_d5<- subset(datF2M, contig == 'Pn_05')

png(filename="C5.png",width=40,height=25,unit="cm", res=600, bg="white")
tN0 <- ggplot(tF0N_d5, aes(a/1000000, meth)) +
  geom_line(color="#DB7C67", size=1.2) + 
  theme(axis.title=element_blank(),
        panel.background = element_rect(fill = 'white', color="black")) 
tM0 <- ggplot(tF0M_d5, aes(a/1000000, meth)) +
  geom_line(color="#27AD4E", size=1.2) +
    theme(axis.title=element_blank(),         panel.background = element_rect(fill = 'white', color="black")) 
tM1 <- ggplot(tF1M_d5, aes(a/1000000, meth)) +
  geom_line(color="#53A8DE", size=1.2) +
    theme(axis.title=element_blank(),         panel.background = element_rect(fill = 'white', color="black")) 
tM2 <- ggplot(tF2M_d5, aes(a/1000000, meth)) +
  geom_line(color="#D06FA8", size=1.2) +
    theme(axis.title=element_blank(),         panel.background = element_rect(fill = 'white', color="black")) 
N0 <- ggplot(F0N_d5, aes(a/1000000, meth)) +
  geom_line(color="#DB7C67", size=1.2) + 
  theme(axis.title=element_blank(),         panel.background = element_rect(fill = 'white', color="black")) 
M0 <- ggplot(F0M_d5, aes(a/1000000, meth)) +
  geom_line(color="#27AD4E", size=1.2) +
  theme(axis.title=element_blank(),         panel.background = element_rect(fill = 'white', color="black")) 
M1 <- ggplot(F1M_d5, aes(a/1000000, meth)) +
  geom_line(color="#53A8DE", size=1.2) +
  theme(axis.title=element_blank(),         panel.background = element_rect(fill = 'white', color="black")) 
M2 <- ggplot(F2M_d5, aes(a/1000000, meth)) +
  geom_line(color="#D06FA8", size=1.2) +
  theme(axis.title=element_blank(),         panel.background = element_rect(fill = 'white', color="black")) 
eN0 <- ggplot(eF0N_d5, aes(a/1000000, meth)) +
  geom_line(color="#DB7C67", size=1.2) + 
  theme(axis.title=element_blank(),         panel.background = element_rect(fill = 'white', color="black")) 
eM0 <- ggplot(eF0M_d5, aes(a/1000000, meth)) +
  geom_line(color="#27AD4E", size=1.2) +
  theme(axis.title=element_blank(),         panel.background = element_rect(fill = 'white', color="black")) 
eM1 <- ggplot(eF1M_d5, aes(a/1000000, meth)) +
  geom_line(color="#53A8DE", size=1.2) +
  theme(axis.title=element_blank(),         panel.background = element_rect(fill = 'white', color="black")) 
eM2 <- ggplot(eF2M_d5, aes(a/1000000, meth)) +
  geom_line(color="#D06FA8", size=1.2) +
  theme(axis.title=element_blank(), panel.background = element_rect(fill = 'white', color="black")) 
grid.arrange(tN0,N0,eN0,tM0,M0,eM0,tM1,M1,eM1,tM2,M2,eM2,nrow=4,ncol=3)
dev.off()

