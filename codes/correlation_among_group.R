setwd("D:/Lab/OA/Pn_OA/revision/cor/mant")
getwd()

df1 <- read.csv("F0N.pro.tsv", header= TRUE, sep="\t")
df2 <- read.csv("F0M.pro.tsv", header= TRUE, sep="\t")
df3 <- read.csv("F1M.pro.tsv", header= TRUE, sep="\t")
df4 <- read.csv("F2M.pro.tsv", header= TRUE, sep="\t")

F0N_genometh <- cor.test(df1$geno, df1$meth, method ="kendall")
F0N_genogbm <- cor.test(df1$geno, df1$gbm, method ="kendall")
F0N_genorna <- cor.test(df1$geno, df1$rna, method ="kendall")
F0N_methgbm <- cor.test(df1$meth, df1$gbm, method ="kendall")
F0N_methrna <- cor.test(df1$meth, df1$rna, method ="kendall")
F0N_gbmrna <- cor.test(df1$gbm, df1$rna, method ="kendall")

F0M_genometh <- cor.test(df2$geno, df2$meth, method ="kendall")
F0M_genogbm <- cor.test(df2$geno, df2$gbm, method ="kendall")
F0M_genorna <- cor.test(df2$geno, df2$rna, method ="kendall")
F0M_methgbm <- cor.test(df2$meth, df2$gbm, method ="kendall")
F0M_methrna <- cor.test(df2$meth, df2$rna, method ="kendall")
F0M_gbmrna <- cor.test(df2$gbm, df2$rna, method ="kendall")

F1M_genometh <- cor.test(df3$geno, df3$meth, method ="kendall")
F1M_genogbm <- cor.test(df3$geno, df3$gbm, method ="kendall")
F1M_genorna <- cor.test(df3$geno, df3$rna, method ="kendall")
F1M_methgbm <- cor.test(df3$meth, df3$gbm, method ="kendall")
F1M_methrna <- cor.test(df3$meth, df3$rna, method ="kendall")
F1M_gbmrna <- cor.test(df3$gbm, df3$rna, method ="kendall")

F2M_genometh <- cor.test(df4$geno, df4$meth, method ="kendall")
F2M_genogbm <- cor.test(df4$geno, df4$gbm, method ="kendall")
F2M_genorna <- cor.test(df4$geno, df4$rna, method ="kendall")
F2M_methgbm <- cor.test(df4$meth, df4$gbm, method ="kendall")
F2M_methrna <- cor.test(df4$meth, df4$rna, method ="kendall")
F2M_gbmrna <- cor.test(df4$gbm, df4$rna, method ="kendall")

F2M_genometh
F1M_methrna
F0N_genogbm
F0N_genorna
F0N_gbmrna

F0N_genopro <- cor.test(df1$geno, df1$pro, method ="kendall")
F0N_prorna <- cor.test(df1$pro, df1$rna, method ="kendall")
F0M_genopro <- cor.test(df2$geno, df2$pro, method ="kendall")
F0M_prorna <- cor.test(df2$pro, df2$rna, method ="kendall")
F1M_genopro <- cor.test(df3$geno, df3$pro, method ="kendall")
F1M_prorna <- cor.test(df3$pro, df3$rna, method ="kendall")
F2M_genopro <- cor.test(df4$geno, df4$pro, method ="kendall")
F2M_prorna <- cor.test(df4$pro, df4$rna, method ="kendall")


F0N_genopro
F0N_prorna
F0M_genopro
F0M_prorna
F1M_genopro
F1M_prorna
F2M_genopro
F2M_prorna


cor.test(df4$gbm, df4$rna, method ="pearson")
