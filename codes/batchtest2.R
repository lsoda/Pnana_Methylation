#Dependencies
library(devtools)
library(Biobase)
library(sva)
library(bladderbatch)
library(snpStats)

data(bladderdata)
setwd('D:/Lab/OA/Pn_OA/Nextdenovo_RNASeq/DAPC/2')
pheno = read.table('./conds_methyl_multiline3.txt', sep='\t')
names(pheno)=c("sample","ind","ori","tra", "qus", "tst")
edata = read.table("methyl_gbm.txt", header=TRUE, sep="\t", as.is=c(1,2), row.names=1)
names(edata) = c("F0N_1", "F0N_2", "F0N_3", "F0N_4", 
                            "F0M_1", "F0M_2", "F0M_4", 
                            "F1M_1", "F1M_2", "F1M_3", "F1M_4", 
                            "F2M_1", "F2M_2", "F2M_3", "F2M_4",
                            "F3N_1", "F3N_2", "F3N_3", 
                            "F3M_1", "F3M_2", "F3M_3", 
                            "F4M_1", "F4M_2", "F4M_3",
                            "F1T_1", "F1T_2", "F1T_3", 
                            "F2T_1", "F2T_2", "F2T_3")
edata<-as.matrix(edata)
pheno

#Adjusting for batch effects with a linear model
mod = model.matrix(~as.factor(ind) + as.factor(qus),data=pheno)
fit = lm.fit(mod,t(edata))
hist(fit$coefficients[2,],col=2,breaks=100)

table(pheno$ind, pheno$qus)

#Adjusting for batch effects with Combat
#returns a ¡°cleaned¡± data matrix after batch effects have been removed
batch = pheno$qus
modcombat = model.matrix(~1, data=pheno)
modcancer = model.matrix(~tra, data=pheno)
combat_edata = ComBat(dat=edata, batch=batch, mod=modcancer, par.prior=TRUE, prior.plots=FALSE)

combat_fit = lm.fit(modcancer,t(combat_edata))
hist(combat_fit$coefficients[2,],col=2,breaks=100)

#Comparing Combat and linear adjustment
plot(fit$coefficients[2,],combat_fit$coefficients[2,],col=2,
     xlab="Linear Model",ylab="Combat",xlim=c(-5,5),ylim=c(-5,5))
abline(c(0,1),col=1,lwd=3)

#Adjusting for batch effects with sva
##First we need to estimate the surrogate variables. 
##To do this, we need to build a model with any known adjustment variables and the variable we care about mod and another model with only the adjustment variables.
##Here we won¡¯t adjust for anything to see if sva can ¡°discover¡± the batch effect.
mod = model.matrix(~tra,data=pheno)
mod0 = model.matrix(~1, data=pheno)

sva1 = sva(edata,mod,mod0,n.sv=2)
##See if any of the variables correlate with batch
summary(lm(sva1$sv ~ pheno$qus))
boxplot(sva1$sv[,2] ~ pheno$qus)
points(sva1$sv[,2] ~ jitter(as.numeric(pheno$qus)),col=as.numeric(pheno$qus))

#Add the surrogate variables to the model matrix and perform the model fit
modsv = cbind(mod,sva1$sv)
fitsv = lm.fit(modsv,t(edata))
#Compare the fit from surrogate variable analysis to the other two.
par(mfrow=c(1,2))
plot(fitsv$coefficients[2,],combat_fit$coefficients[2,],col=2,
     xlab="SVA",ylab="Combat",xlim=c(-5,5),ylim=c(-5,5))
abline(c(0,1),col=1,lwd=3)
plot(fitsv$coefficients[2,], fit$coefficients[2,],col=2,
     xlab="SVA",ylab="linear model",xlim=c(-5,5),ylim=c(-5,5))
abline(c(0,1),col=1,lwd=3)


#Principal components for populatin structure
#Load an example data set and take a smaller subset of samples for computational efficiency
data(for.exercise)
controls <- rownames(subject.support)[subject.support$cc==0]
use <- seq(1, ncol(snps.10), 10)
ctl.10 <- snps.10[controls,use]
#Calculate the PCs
xxmat <- xxt(ctl.10, correct.for.missing=FALSE)
evv <- eigen(xxmat, symmetric=TRUE)
pcs <- evv$vectors[,1:5]
#Let¡¯s compare the PCs to the population labels and see that PC1 captures the population variable very well
pop <- subject.support[controls,"stratum"]
plot(pcs[,1],pcs[,2],col=as.numeric(pop),
     xlab="PC1",ylab="PC2")
legend(0,0.15,legend=levels(pop),pch=19,col=1:2)
