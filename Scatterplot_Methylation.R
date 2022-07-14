library(dplyr)
library(gplots)
library(ggplot2)
library(runner)
library(zoo)

setwd("D:/Lab/OA/Pn_OA/revision/cor/annot")
getwd()
datraw <- read.csv("F0N.annot.cov", sep="\t")
colnames(datraw) <- c("contig", "pos", "meth", "type")

F0N_d1<- subset(datraw, contig == 'Pn_01')
F0N_d2<- subset(datraw, contig == 'Pn_02')
F0N_d3<- subset(datraw, contig == 'Pn_03')
F0N_d4<- subset(datraw, contig == 'Pn_04')
F0N_d5<- subset(datraw, contig == 'Pn_05')
F0N_d6<- subset(datraw, contig == 'Pn_06')
F0N_d7<- subset(datraw, contig == 'Pn_07')
F0N_d8<- subset(datraw, contig == 'Pn_08')
F0N_d9<- subset(datraw, contig == 'Pn_09')
F0N_d10<- subset(datraw, contig == 'Pn_10')
datraw <- read.csv("F0M.annot.cov", sep="\t")
colnames(datraw) <- c("contig", "pos", "meth", "type")

F0M_d1<- subset(datraw, contig == 'Pn_01')
F0M_d2<- subset(datraw, contig == 'Pn_02')
F0M_d3<- subset(datraw, contig == 'Pn_03')
F0M_d4<- subset(datraw, contig == 'Pn_04')
F0M_d5<- subset(datraw, contig == 'Pn_05')
F0M_d6<- subset(datraw, contig == 'Pn_06')
F0M_d7<- subset(datraw, contig == 'Pn_07')
F0M_d8<- subset(datraw, contig == 'Pn_08')
F0M_d9<- subset(datraw, contig == 'Pn_09')
F0M_d10<- subset(datraw, contig == 'Pn_10')
datraw <- read.csv("F1M.annot.cov", sep="\t")
colnames(datraw) <- c("contig", "pos", "meth", "type")

F1M_d1<- subset(datraw, contig == 'Pn_01')
F1M_d2<- subset(datraw, contig == 'Pn_02')
F1M_d3<- subset(datraw, contig == 'Pn_03')
F1M_d4<- subset(datraw, contig == 'Pn_04')
F1M_d5<- subset(datraw, contig == 'Pn_05')
F1M_d6<- subset(datraw, contig == 'Pn_06')
F1M_d7<- subset(datraw, contig == 'Pn_07')
F1M_d8<- subset(datraw, contig == 'Pn_08')
F1M_d9<- subset(datraw, contig == 'Pn_09')
F1M_d10<- subset(datraw, contig == 'Pn_10')

datraw <- read.csv("F2M.annot.cov", sep="\t")
colnames(datraw) <- c("contig", "pos", "meth", "type")

F2M_d1<- subset(datraw, contig == 'Pn_01' )
F2M_d2<- subset(datraw, contig == 'Pn_02')
F2M_d3<- subset(datraw, contig == 'Pn_03')
F2M_d4<- subset(datraw, contig == 'Pn_04')
F2M_d5<- subset(datraw, contig == 'Pn_05')
F2M_d6<- subset(datraw, contig == 'Pn_06')
F2M_d7<- subset(datraw, contig == 'Pn_07')
F2M_d8<- subset(datraw, contig == 'Pn_08')
F2M_d9<- subset(datraw, contig == 'Pn_09')
F2M_d10<- subset(datraw, contig == 'Pn_10')

png(filename="Contig_1.png",width=19.05,height=11.04,unit="cm", res=600, bg="white")
N0 <- ggplot(F1M_d1, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M0 <- ggplot(F0M_d1, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M1 <- ggplot(F1M_d1, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M2<- ggplot(F2M_d1, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
grid.arrange(N0,M0,M1,M2, ncol=2,nrow=2)
dev.off()

png(filename="Contig_2.png",width=19.05,height=11.04,unit="cm", res=600, bg="white")
N0 <- ggplot(F1M_d2, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M0 <- ggplot(F0M_d2, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M1 <- ggplot(F1M_d2, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M2<- ggplot(F2M_d2, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
grid.arrange(N0,M0,M1,M2, ncol=2,nrow=2)
dev.off()

png(filename="Contig_3.png",width=19.05,height=11.04,unit="cm", res=600, bg="white")
N0 <- ggplot(F1M_d3, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M0 <- ggplot(F0M_d3, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M1 <- ggplot(F1M_d3, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M2<- ggplot(F2M_d3, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
grid.arrange(N0,M0,M1,M2, ncol=2,nrow=2)
dev.off()

png(filename="Contig_4.png",width=19.05,height=11.04,unit="cm", res=600, bg="white")
N0 <- ggplot(F1M_d4, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M0 <- ggplot(F0M_d4, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M1 <- ggplot(F1M_d4, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M2<- ggplot(F2M_d4, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
grid.arrange(N0,M0,M1,M2, ncol=2,nrow=2)
dev.off()

png(filename="Contig_5.png",width=19.05,height=11.04,unit="cm", res=600, bg="white")
N0 <- ggplot(F1M_d5, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M0 <- ggplot(F0M_d5, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M1 <- ggplot(F1M_d5, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M2<- ggplot(F2M_d5, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
grid.arrange(N0,M0,M1,M2, ncol=2,nrow=2)
dev.off()

png(filename="Contig_6.png",width=19.05,height=11.04,unit="cm", res=600, bg="white")
N0 <- ggplot(F1M_d6, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M0 <- ggplot(F0M_d6, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M1 <- ggplot(F1M_d6, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M2<- ggplot(F2M_d6, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
grid.arrange(N0,M0,M1,M2, ncol=2,nrow=2)
dev.off()

png(filename="Contig_7.png",width=19.05,height=11.04,unit="cm", res=600, bg="white")
N0 <- ggplot(F1M_d7, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M0 <- ggplot(F0M_d7, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M1 <- ggplot(F1M_d7, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M2<- ggplot(F2M_d7, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
grid.arrange(N0,M0,M1,M2, ncol=2,nrow=2)
dev.off()

png(filename="Contig_8.png",width=19.05,height=11.04,unit="cm", res=600, bg="white")
N0 <- ggplot(F1M_d8, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M0 <- ggplot(F0M_d8, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M1 <- ggplot(F1M_d8, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M2<- ggplot(F2M_d8, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
grid.arrange(N0,M0,M1,M2, ncol=2,nrow=2)
dev.off()

png(filename="Contig_9.png",width=19.05,height=11.04,unit="cm", res=600, bg="white")
N0 <- ggplot(F1M_d9, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M0 <- ggplot(F0M_d9, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M1 <- ggplot(F1M_d9, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M2<- ggplot(F2M_d9, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
grid.arrange(N0,M0,M1,M2, ncol=2,nrow=2)
dev.off()

png(filename="Contig_10.png",width=19.05,height=11.04,unit="cm", res=600, bg="white")
N0 <- ggplot(F1M_d10, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M0 <- ggplot(F0M_d10, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M1 <- ggplot(F1M_d10, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
M2<- ggplot(F2M_d10, aes(pos, meth)) +
  geom_point(shape = 16, size = .1, alpha=.05, col="blue") +
  theme_minimal()
grid.arrange(N0,M0,M1,M2, ncol=2,nrow=2)
dev.off()


