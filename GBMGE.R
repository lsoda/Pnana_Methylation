setwd("D://Lab//OA//Pn_OA//3replicate//2rep_dmg")
getwd()

changeF0 = read.table('./F0_table.txt', header = T)
degF0 = read.table('./deg_F0.csv', header = T, sep=',', row.names=1)

classes = read.table('./logfrac.txt', header = T)

head(changeF0)
changeF0$logDMG=as.numeric(as.character(changeF0$logDMG))
changeF0$logFC=as.numeric(as.character(changeF0$logFC))
degF0$logFC=as.numeric(as.character(degF0$logFC))
degF0$FDR=as.numeric(as.character(degF0$FDR))

x=merge(classes,changeF0, by="gene")
row.names(x)<-x$gene
y=deg


#------------------- GBM ~ GE
goods=intersect(row.names(x),row.names(y))
length(goods)
y=y[goods,]
x=x[goods,]
summary(x)
siglimit=1
sigs=(x$padj<=siglimit)
plot(changeF0$logFC~changeF0$logDMG,col=rgb(0,0,0,alpha=0.1),pch=16,cex=0.5,family= "serif", mgp=c(2.3,1,0),xlim=c(-5,5),ylim=c(-10,10))
title(xlab="GBM change", ylab = "Gene Expression (logFC)", family = "serif", cex.lab = 1)
abline(v=0,col="grey70",lty=3)
abline(v=0.15,col="grey70",lty=3)
abline(v=-0.15,col="grey70",lty=3)
abline(h=0,col="grey70",lty=3)
abline(h=1,col="grey70",lty=3)
abline(h=-1,col="grey70",lty=3)
lmm=lm(changeF0$logFC~changeF0$logDMG)

summary(lmm) # R2=0.009
fcimit=1
summary(changeF0)
sigsx=changeF0$logFc>=1
sigsy=changeF0$logDMG>=0.15
sum(sigs)
points(changeF0$logFC[sigsx]~changeF0$logDMG[sigsx],col=rgb(0.8,0.2,0.2,alpha=0.25), pch=16,cex=0.5)

summary(lmm) # R2=0.009
siglimit=0.1
summary(x)
sigsx=(x$padj<=siglimit)
sigsy=(y$FDR<=siglimit)
sum(sigs)
points(y$logFC[sigsx]~x$lfc[sigsx],col=rgb(0.8,0.2,0.2,alpha=0.25), pch=16,cex=0.5)

summary(lmm) # R2=0.009
siglimit=0.1
summary(x)
sigsx=(x$padj<=siglimit)
sigsy=(y$FDR<=siglimit)
sum(sigs)
points(y$logFC[sigsx]~x$lfc[sigsx],col=rgb(0.8,0.2,0.2,alpha=0.25), pch=16,cex=0.5)

summary(lmm) # R2=0.009
siglimit=0.1
summary(x)
sigsx=(x$padj<=siglimit)
sigsy=(y$FDR<=siglimit)
sum(sigs)
points(y$logFC[sigsx]~x$lfc[sigsx],col=rgb(0.8,0.2,0.2,alpha=0.25), pch=16,cex=0.5)