YL=c(-5,5);YLAB="GBM change";DSCALE=1.2 # Fig 2A, Fig. S8A. 853 DMGs, 65 up, 788 down
library(extrafont)
library(ggplot2)
library(gghighlight)

setwd("D:/Lab/OA/Pn_OA/Nextdenovo_GLM")
getwd()

changeF0 = read.table('./Pn_next_DMG_F0_nonsig.txt', header = T)
changeF1 = read.table('./Pn_next_DMG_F1_nonsig.txt', header = T)
changeF2 = read.table('./Pn_next_DMG_F2_nonsig.txt', header = T)
degF0 = read.table('../Nextdenovo_RNASeq/F0_DEG_total.txt', header = T)
degF1 = read.table('../Nextdenovo_RNASeq/F1_DEG_total.txt', header = T)
degF2 = read.table('../Nextdenovo_RNASeq/F2_DEG_total.txt', header = T)

classes = read.table('./all.meanmeth.txt', header = T)

changeF0$lfc=as.numeric(as.character(changeF0$lfc))
changeF0$padj=as.numeric(as.character(changeF0$pvalue))
degF0$logFC=as.numeric(as.character(degF0$LogFC))
degF0$FDR=as.numeric(as.character(degF0$P.value))

changeF1$lfc=as.numeric(as.character(changeF1$lfc))
changeF1$padj=as.numeric(as.character(changeF1$pvalue))
degF1$logFC=as.numeric(as.character(degF1$LogFC))
degF1$FDR=as.numeric(as.character(degF1$P.value))

changeF2$lfc=as.numeric(as.character(changeF2$lfc))
changeF2$padj=as.numeric(as.character(changeF2$pvalue))
degF2$logFC=as.numeric(as.character(degF2$LogFC))
degF2$FDR=as.numeric(as.character(degF2$P.value))

x=merge(classes, changeF2, by="id")
row.names(x)<-x$id
y=degF1
row.names(y)<-y$gene
z=merge(changeF0,changeF1,by="id")

head(z)
head(changeF0)
windowsFonts(A = windowsFont("Times New Roman"))

#GBM-GBM
png(filename="F0F2.png", height = 5.5, width = 7.3, units = "cm", res = 1000)
par(mar=c(2,2,.5,.5),oma=c(0,0,0,0))
plot(lfc.y~lfc.x,z, col=rgb(0,0,0,alpha=0.2),pch=16,cex=0.5,ylim=YL,xlim=c(-5,5), xaxt="n",yaxt="n", xlab=NA, ylab=NA)
axis(1,cex.axis=1, family = "A")
axis(2,cex.axis=1, family = "A")
ll=lm(lfc.y~lfc.x,z)
summary(ll) #k2o: 0.13; o2k: 0.54 ; ori: 0.023 ; natives: 0.07 ; k2o.ge: 0.013 ; o2k.ge: 0.017
abline(ll,col="red")
abline(v=0,lty=3,col="grey80",lwd=1.5)
abline(h=0,lty=3,col="grey80",lwd=1.5)
dev.off()
b<-as.numeric(ll$coefficients)

png(filename="Figure_fix/F0F1.png", height = 5.5, width = 7.3, units = "cm", res = 1000)
ggplot(z, aes(x = lfc.x, y = lfc.y)) + 
  geom_point(alpha = .2, cex=.9) +
  coord_cartesian(xlim = c(-2,2), ylim = c(-2,2)) +
  geom_abline(slope = b[2], intercept=b[1], color="blue") +
  theme_classic()+ theme(axis.title.x=element_blank(), axis.title.y=element_blank()) +
  geom_hline(yintercept=0, linetype="longdash", color = "grey") + 
  geom_vline(xintercept=0, linetype="longdash", color= "grey")
dev.off()

#GBM-Fraction
head(x)
png(filename="Figure_fix/GBM_F2.png", height = 5.5, width = 7.3, units = "cm", res = 1000)
par(mar=c(2,2,.5,.5),oma=c(0,0,0,0))
plot(lfc~logmean,x,col=rgb(0,0,0,alpha=0.2),pch=16,cex=0.5,ylim=YL,xlim=c(0,3), xlab="", ylab = "",xaxt="n",yaxt="n", axes=F)
axis(1, family="A", lwd = 0, lwd.ticks = 1, at=0:3)
axis(2, family="A", lwd=0, lwd.ticks = 1)
box(which = "plot", bty = "l")
ll=lm(lfc~logmean,x)
b<-ll$coefficients
siglimit=0.05
xn=na.omit(x)
sigs=(xn$padj<siglimit)

#ggplot(x, aes(x = logmean, y = lfc)) + 
#  geom_point(alpha = .2, cex=.9) +
#  coord_cartesian(xlim = c(-0,3), ylim = c(-4,4)) +
#  geom_abline(slope = b[2], intercept=b[1], color="blue") +
#  theme_classic()+ theme(axis.title.x=element_blank(), axis.title.y=element_blank()) +
#  geom_hline(yintercept=0, linetype="longdash", color = "grey") +
#  geom_point(data=xn[sigs,], aes(x=logmean, y=lfc), colour="red", size=1, alpha = .2)

summary(ll) #k2o: 0.13; o2k: 0.54 ; ori: 0.023 ; natives: 0.07 ; k2o.ge: 0.013 ; o2k.ge: 0.017
abline(ll,col="blue")
abline(h=0,lty=3,col="grey80",lwd=1.5)


# adding density curves for significant genes
siglimit=0.05
xn=na.omit(x)
sigs=(xn$padj<siglimit)
sum(sigs) 
sigsup=(xn$padj<siglimit & xn$lfc>0); sum(sigsup) 
sigsdn=(xn$padj<siglimit & xn$lfc<0); sum(sigsdn) 
points(lfc~logmean,x[sigs,],col=rgb(0.8,0.2,0.2,alpha=.2),pch=16,cex=0.3)
lines(density(xn[sigsup,"logmean"])$x, DSCALE*density(xn[sigsup,"logmean"])$y+YL[1],col="#f26b41",lwd=2)
lines(density(xn[sigsdn,"logmean"])$x, DSCALE*density(xn[sigsdn,"logmean"])$y+YL[1],col="#3e8ced",lwd=2)
dev.off()


#------------------- GBM ~ GE
png(filename="F1_DEG_DMG.png", height = 10, width = 10, units = "cm", res = 1000)
y
goods=intersect(row.names(x),row.names(y))
length(goods)
y=y[goods,]
x=x[goods,]
summary(x)
siglimit=1
sigs=(x$pvalue<=siglimit)
plot(y$LogFC[sigs]~x$lfc[sigs],col=rgb(0,0,0,alpha=0.05),pch=16,cex=0.5,family= "serif",xlab="",ylab="", mgp=c(2.3,1,0),xlim=c(-5,5),ylim=c(-4,4))
abline(v=0,col="grey70",lty=3)
abline(h=0,col="grey70",lty=3)
abline(h=1,lty=3,col="grey80",lwd=1.5)
abline(h=-1,lty=3,col="grey80",lwd=1.5)
lmm=lm(y$LogFC~x$lfc)
abline(lmm,col="red")

summary(lmm) # R2=0.009
siglimit=0.05
summary(x)
pointy=y[y$LogFC>=1 | y$LogFC<=-1,]
pointy
sigsx=x[x$pvalue<=siglimit,]
sigsy=(y$P.value<=siglimit)
sum(sigs)
points(pointy$LogFC[sigsy]~sigsx$lfc[sigsy],col=rgb(0.8,0.2,0.2,alpha=0.25), pch=16,cex=0.5)

