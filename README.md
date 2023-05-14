# Single-Cell Analysis of Postnatal Human Cerebrovasculature Reveals the Potential Neurotoxicity of CD19-Directed CAR-T Therapy
# 20.440_BiologicalNetwork Termproject, 2023.05.14

Jisoo Kim, Department of Chemcial Engineering
MIT & Jinyeop Song, Deparment of Physics, MIT

# Abstract
CAR-T cell therapy targeting CD19 has shown great potential in treating cancer, but it often leads to neurotoxicity. Recent studies have revealed that a small fraction of non-B cells in the human brain expresses CD19, but these analyses were limited to prenatal samples, and adult brain analysis only involved bulk RNA-seq data. To address this gap, we examined the CD19 expression profile of the adult human cerebrovasculature using a dataset of single-cell characterization. Our analysis identified CD19-expressing cell populations in endothelial cells, mural cells, and perivascular fibroblasts. Furthermore, differential gene expression analysis between CD19-positive and negative cells identified significant gene sets with high fold-change in different cell types. CD19 expression levels were variable among individuals but consistent across age and gender

# Overview
This repo is to visualize mouse brain transcriptome data by generating various plots, including FeatureScatter, Heatmap, LabelPoint, PCA_cluster, and VlnPlot. 

# Data
The Data_BBB folder contains count matrices for human cerebrovasculature have been downloaded at http://compbio.mit.edu/scBBB/. An interactive website(https://nsun.shinyapps.io/scbbb/) is used for the initial characterization.

Since the original data is heavy(5.4Gb), we saved an processed data by reducing number of features and number of cells. It is saved as "Data_BBB/brain.BBB.human.vascular.final.rds" and "Data_BBB/brain.BBB.human.vascular.final.Jan2022.metadata.rds"

# Folder structure
- Figures : This folder contains generated figure. 
- Data_BBB : This folder contains the processed data files(RDS format)
- Processing_codes : This folder contains the processed R codes

# Installation
- requirements(Program)
Rstudio(4.2.1)

- requirements(R libraries)
```
library(scales)
library(plyr)
library(Seurat)
library(dplyr)
library(patchwork)
library(ggplot2)
library(cowplot)
library("viridis")  
library(RColorBrewer)
library("viridis")
library(Matrix)
library(readxl)
library(caTools)
library(randomForest)
library("ggpubr")
```

# Running
You can simply generate figure by running the following.

```
1_CellTypeClustering.ipynb
```
This code generate human blood-brain barrier cell single-nucleus RNA profiling of 4,992 profiled nuclei.
<img src="/ForReadMe/Picture1.png" alt="Alt text" title="Identification of CD19-expressing cell populations in adult human cerebrovasculature">


```
2_CD19ExpressionCounts.ipynb
```
This code generate CD19 expression profiles of patients and examine potential differences based on gender and age
<img src="/ForReadMe/Picture2.png" alt="Alt text" title=" CD19-expression profiles by patients and identifying differences by genders and age.">

```
3_DifferentialExpression.ipynb
```
This code generate cell-type specific differential gene expression analysis between CD-19 positive and negative cells
<img src="/ForReadMe/Picture3.png" alt="Alt text" title="Differential gene expression between CD-19 positive and negative cells unveils set of genes that are potentially correlated with of CD19 expression">


