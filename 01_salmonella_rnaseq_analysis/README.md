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

## ⚙️ Workflow Architecture
This pipeline systematically executes the following 10 steps identically on every run:
1. **Workspace Initialization**: Creates a structured `READemption_analysis` hierarchy.
2. **Reference Fetching**: Pulls target genome annotations (`NC_016810.fa`, etc.) directly via NCBI FTP.
3. **Annotation Integration**: Downloads and unzips standard GCF features (`GCF_000210855.2`).
4. **Read Acquisition**: Fetches raw `InSPI2` and `LSP` sequence reads (`.bz2`).
5. **Core Alignment**: Multi-threaded read mapping with adaptive poly-A clipping.
6. **Coverage Computation**: Generates strand-specific coverage tracks for browser integration.
7. **Gene Quantification**: Statistically counts sequencing reads matching CDS, tRNA, and rRNA boundaries.
8. **Differential Expression**: Executes DESeq2 variance tests.
9. **Visualization Automation**: Plots alignment demographics and M/A disparity graphs natively.

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

## 📊 Outputs
The script populates an isolated `READemption_analysis/output/` directory delivering:
* **`deseq/`**: Full CSV matrices of differentially expressed genes (providing log2FC and padj parameters).
* **`viz_align/`**: PDF graphical models evaluating overall alignment stability.

> **Note:** Raw FASTQ files, intermediate FASTA, and heavy BAM indexing files are intentionally ignored via `.gitignore` to maintain a lightweight, compliant repository structure.

<br>
<p align="center">Built for Reproducible Bioinformatics</p>
