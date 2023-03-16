# load libraries
library(Seurat)
library(tidyverse)

# Load the dataset
mtx_obj <- ReadMtx(mtx = "data/GSE222510_processed_matrix.mtx",
                   features = "data/GSE222510_processed_genes.tsv",
                   cells = "data/GSE222510_processed_barcodes.tsv", feature.column=1)
seurat_mtx <- CreateSeuratObject(counts = mtx_obj)

# 1. QC -------
View(seurat_mtx@meta.data)
# % MT reads
seurat_mtx[["percent.mt"]] <- PercentageFeatureSet(seurat_mtx, pattern = "^MT-")
View(seurat_mtx@meta.data)

VlnPlot(seurat_mtx, features = c("nFeature_RNA", "nCount_RNA"), ncol = 3)
FeatureScatter(seurat_mtx, feature1 = "nCount_RNA", feature2 = "nFeature_RNA") +
  geom_smooth(method = 'lm')

# 2. Filtering -----------------
seurat_mtx <- subset(seurat_mtx, subset = nFeature_RNA > 200 & nFeature_RNA < 2500 & 
                             percent.mt < 5)

# 3. Normalize data ----------
#nsclc.seurat.obj <- NormalizeData(nsclc.seurat.obj, normalization.method = "LogNormalize", scale.factor = 10000)
# OR
seurat_mtx <- NormalizeData(seurat_mtx)
str(seurat_mtx)

# 4. Identify highly variable features --------------
seurat_mtx <- FindVariableFeatures(seurat_mtx, selection.method = "vst", nfeatures = 2000)
seurat_mtx <- seurat_mtx[1:10000,1:1000]

seurat_mtx <- UpdateSeuratObject(seurat_mtx)
seurat_mtx <- SCTransform(seurat_mtx, assay = "Spatial", verbose = FALSE)
seurat_mtx <- RunPCA(seurat_mtx)
seurat_mtx <- FindNeighbors(seurat_mtx, dims = 1:30)
seurat_mtx <- FindClusters(seurat_mtx, verbose = FALSE)
seurat_mtx <- RunUMAP(seurat_mtx, dims = 1:30)

seurat_mtx

save_path <- "processed_data/test_seurat.rds"
saveRDS(seurat_mtx,file=save_path )













# Identify the 10 most highly variable genes
top10 <- head(VariableFeatures(seurat_mtx), 10)

# plot variable features with and without labels
plot1 <- VariableFeaturePlot(seurat_mtx)
LabelPoints(plot = plot1, points = top10, repel = TRUE)

# 5. Scaling -------------
all.genes <- rownames(seurat_mtx)
seurat_mtx <- ScaleData(seurat_mtx, features = all.genes)

=

str(seurat_mtx)

# 6. Perform Linear dimensionality reduction --------------
seurat_mtx <- RunPCA(seurat_mtx, features = VariableFeatures(object = seurat_mtx))

