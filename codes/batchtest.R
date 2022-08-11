#Dependencies
library(devtools)
library(Biobase)
library(sva)
library(bladderbatcars)
library(snpStats)

data(bladderdata)
pheno = pData(bladderEset)
edata = exprs(bladderEset)


#Adjusting for batch effects with a linear model
mod = model.matrix(~as.factor(cancer) + as.factor(batch),data=pheno)
fit = lm.fit(mod,t(edata))
hist(fit$coefficients[2,],col=2,breaks=100)

table(pheno$cancer,pheno$batch)

#Adjusting for batch effects with Combat
#returns a ¡°cleaned¡± data matrix after batch effects have been removed
batch = pheno$batch
modcombat = model.matrix(~1, data=pheno)
modcancer = model.matrix(~cancer, data=pheno)
combat_edata = ComBat(dat=edata, batch=batch, mod=modcombat, par.prior=TRUE, prior.plots=FALSE)

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
mod = model.matrix(~cancer,data=pheno)
mod0 = model.matrix(~1, data=pheno)
sva1 = sva(edata,mod,mod0,n.sv=2)
str(edata)
str(mod)
##See if any of the variables correlate with batch
summary(lm(sva1$sv ~ pheno$batch))

boxplot(sva1$sv[,2] ~ pheno$batch)
points(sva1$sv[,2] ~ jitter(as.numeric(pheno$batch)),col=as.numeric(pheno$batch))

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
