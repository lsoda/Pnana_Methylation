# Pnana_Methylation
Code to create figures of article "Epigenetic plasticity enables copepods to cope with ocean acidification" by Lee et al., 2022 accepted in Nat. Clim. Change

* Requirement (in my case)
 - Windows 10, Ubuntu ver. 18.0.4 LTS
 - R and Rstudio (I used R version 3.6.4)
 - R package
   'dplyr' : Data manipulation
   'tidyverse' : Data manipulation
   'ggplot2' : Plotting the results
   'pheatmap' : Heatmap plotting
   'RColorBrewer' : Diverse color for plots
   'sva' : To remove batch effect between experimental samples

* Custom code
 - `GBM_fraction.R` : Compare methylation fraction (log10Methylation%) and GBM change (logDMR), and GBM compare between generation grpus (Fig. 5b)
 - `GO_heatmap.R` : Heatmap for the canonical pathway of IPA results (Fig.5d)
 - `CpG_repeat_violin.R` : Create violin plot wtih CpG data of Transposable elements (Extended Data Fig.3)
 - `GBMGE.R` : DAPC analysis result of GBM (Gene Body Methylation; DMGs) and GE (Gene Expression; DEGs) (Extended Data Fig. 7) 
 - `Scatterplot_Methylation.R` : Scatter plot of DNA methylation
 - `TEdistribution.R` : Transposable element distribution among species (Supplemetnary Fig. 1)
 - `correlation_among_group.R` : Correlation test of among groups with Mantel test and Kendall's correlation (Supplementary Fig. 4)
 - `histone_heatmap.R` : Heatmap for histone and histone modification genes (Supplementary Fig. 10)
 - `slidingwinodw_methylation.R` : Calculate slidingwindow of DNA methylation on the genome and draw line plot
 - `batch.R`, `batch2.R` : remove batch effect from groups with different time sequenced - using two method sva, and ComBat
