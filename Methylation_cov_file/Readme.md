# Methylation Coverage data
After processing Bismark program we got bedGraph and Cov file. And we filtered cov files and annotated their positions from gff3 files of de novo genome assembly files.
In this direcotry, we saved our cov files that used to analyze epigenetics and visualizaing results as plot.

* File list
  - all.merged.annot.tgz : merge all methylation data from F0N, F0M, F1M, and F2M
  - all.filt.pct.tgz : Each methylation percentage at same position of experimental groups (F0N, F0M, F1M, and F2M) of replicates (1-4)
  - F0N (pH 8.0 exposure during F0 generation)
    - F0N.merged.tgz : merged information of all replicates of F0N
    - F0N-1~4.annot.tgz : methylation percentage at each position with their annotation information in each replicate of F0N
  - F0M (pH 7.3 exposure during F0 generation)
    - F0M.merged.tgz : merged information of all replicates of F0M
    - F0M-1~4.annot.tgz : methylation percentage at each position with their annotation information in each replicate of F0M
  - F1M (pH 7.3 exposure during F0 and F1 generation)
    - F1M.merged.tgz : merged information of all replicates of F1M
    - F1M-1~4.annot.tgz : methylation percentage at each position with their annotation information in each replicate of F1M
  - F2M (pH 7.3 exposure during F0, F1, and F2 generation)
    - F2M.merged.tgz : merged information of all replicates of F2M
    - F2M-1~4.annot.tgz : methylation percentage at each position with their annotation information in each replicate of F2M
  - F3N (pH 8.0 exposure during F0, F1, F2, and F3 generation)
    - PnOA_F3N-1~3.annot.tgz : methylation percentage at each position with their annotation information in each replicate of F3N
  - F3M (pH 7.3 exposure during F0, F1, F2, and F3 generation)
    - PnOA_F3M-1~3.annot.tgz : methylation percentage at each position with their annotation information in each replicate of F3M
  - F4M (pH 7.3 exposure during F0, F1, F2, F3 and F4 generation)
    - PnOA_F4M-1~3.annot.tgz : methylation percentage at each position with their annotation information in each replicate of F4M
  - F1T (pH 7.3 exposure during F1 generation while F0 generation exposed at pH 8.0)
    - PnOA_F1T-1~3.annot.tgz : methylation percentage at each position with their annotation information in each replicate of F1T
  - F2T (pH 7.3 exposure during F1 and F2 generation while F0 generation exposed at pH 8.0)
    - PnOA_F2T-1~3.annot.tgz : methylation percentage at each position with their annotation information in each replicate of F2T
    
