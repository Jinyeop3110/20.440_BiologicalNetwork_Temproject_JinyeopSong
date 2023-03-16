# 20.440_BiologicalNetwork
## Identifying a pre-clinical model for predicting neurotoxic side-effects of CD19-directed CAR-T cell therapy

# Motivation of the project
Chimeric antigen receptor (CAR)-T cell therapy has shown exceptional clinical outcomes, making it a groundbreaking treatment alternative for cancer. CAR-T cell therapy employs artificially engineered receptors to specifically recognize and eradicate tumor cells by targeting their surface antigens. One of the primary hurdles, however, is the risk of on-target, off-tumor toxicity (OTOT) associated with CAR-T cell therapy. This occurs when CAR-T cells erroneously attack healthy tissues expressing the same antigen as the tumor cells, leading to potentially severe complications. Here, we propose three distinct potential projects that utilize single-cell transcriptomics data to forecast the occurrence of off-tumor toxicity in CAR-T immunotherapies.


# Overview
This repo is to visualize mouse brain transcriptome data by generating various plots, including FeatureScatter, Heatmap, LabelPoint, PCA_cluster, and VlnPlot. 

# Data
The data(GSE222510) is the mouse brain scRNA by shifting aging signatures in multiple cell types. 
Total of 56 mouse brains with raw and processed data for 158,767 cells and filtered data for 50 mouse brains and 105,329 cells.
https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE222510
Since the original data is heavy(5.4Gb), we saved an processed data by reducing number of features and number of cells. It is "processed_data/test_seurat.rds"

# Folder structure
- figure : This folder contains generated figure. 
- processed_data : This folder contains the processed data files(RDS format)

# Installation
-requirements
Rstudio
library(Seurat)
library(tidyverse)
library(here)

# Running
You can simply generate figure by running the following.
```
Rscript PlotSimple.R 
```



