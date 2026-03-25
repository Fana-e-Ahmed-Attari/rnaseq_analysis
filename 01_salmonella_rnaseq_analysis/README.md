<div align="center">
  
# 🦠 Salmonella Typhimurium RNA-Seq Pipeline

[![READemption](https://img.shields.io/badge/Pipeline-READemption-blue)](https://reademption.readthedocs.io/)
[![Bash](https://img.shields.io/badge/Script-Bash-green)](#)
[![Conda](https://img.shields.io/badge/Environment-Conda-lightgrey)](#)

*An automated, end-to-end RNA-Seq bioinformatic pipeline for processing **Salmonella Typhimurium (SL1344)** data, from raw sequence reads to differential expression analysis.*
</div>

---

## 📑 Table of Contents
1. [Overview](#-overview)
2. [Workflow Architecture](#-workflow-architecture)
3. [Prerequisites](#-prerequisites)
4. [Usage Execution](#-usage-execution)
5. [Outputs](#-outputs)

---

## 🔬 Overview
This subdirectory hosts the robust Bash execution script (`run_salmonella_analysis.sh`) that fully automates our RNA-Seq workflow. It maps raw reads against the *Salmonella Typhimurium* reference genome and performs strictly controlled Differential Gene Expression (DGE) using DESeq2.

---

### 📊 Experimental Design & Library Mapping

| Dataset Source | Condition | Environment | Replicate | Library ID |
| :--- | :--- | :--- | :--: | :--- |
| [InSPI2_R1](http://reademptiondata.imib-zinf.net/InSPI2_R1.fa.bz2) | **InSPI2** | Intracellular-like | 1 | `InSPI2_R1` |
| [InSPI2_R2](http://reademptiondata.imib-zinf.net/InSPI2_R2.fa.bz2) | **InSPI2** | Intracellular-like | 2 | `InSPI2_R2` |
| [LSP_R1](http://reademptiondata.imib-zinf.net/LSP_R1.fa.bz2) | **LSP** | Late Stationary Phase | 1 | `LSP_R1` |
| [LSP_R2](http://reademptiondata.imib-zinf.net/LSP_R2.fa.bz2) | **LSP** | Late Stationary Phase | 2 | `LSP_R2` |

---

## 🛠 Prerequisites
You must have the `reademption` conda environment compiled and activated before execution. (Setup instructions are in the root directory).
```bash
conda activate reademption
```

---

## 🚀 Usage Execution
To execute the pipeline, simply invoke the Bash script from this directory:
```bash
bash run_salmonella_analysis.sh
```

---

## 🎨 Analytical Visualizations
Key results from the Salmonella analysis are curated in the [`visualizations/`](./visualizations) directory:
- **[Salmonella_MA_Plot.pdf](./visualizations/Salmonella_MA_Plot.pdf)**: Illustrates the expression breadth and fold-change disparity between InSPI2 and LSP conditions.
- **[Salmonella_Volcano_Plot.pdf](./visualizations/Salmonella_Volcano_Plot.pdf)**: Visualizes statistical significance against log2 fold change, highlighting the primary transcriptomic recruits.

---

## 📊 Outputs
The script populates an isolated `READemption_analysis/output/` directory delivering:
* **`deseq/`**: Full CSV matrices of differentially expressed genes (providing log2FC and padj parameters).
* **`viz_align/`**: PDF graphical models evaluating overall alignment stability.

> **Note:** Raw FASTQ files, intermediate FASTA, and heavy BAM indexing files are intentionally ignored via `.gitignore` to maintain a lightweight, compliant repository structure.

<br>
<p align="center">Built for Reproducible Bioinformatics</p>
