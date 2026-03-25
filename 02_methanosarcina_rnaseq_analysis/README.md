<div align="center">
  
# 🦠 Methanosarcina mazei RNA-Seq Pipeline

[![READemption](https://img.shields.io/badge/Pipeline-READemption-blue)](https://reademption.readthedocs.io/)
[![Bash](https://img.shields.io/badge/Script-Bash-green)](#)
[![Archaea](https://img.shields.io/badge/Domain-Archaea-orange)](#)

*An automated, tailored RNA-Seq pipeline for processing archael **Methanosarcina mazei** data, investigating differential expression between Wild-Type (WT) and Mutant strains.*
</div>

---

## 📑 Table of Contents
1. [Overview](#-overview)
2. [Workflow Architecture](#-workflow-architecture)
3. [Prerequisites](#-prerequisites)
4. [Usage Execution](#-usage-execution)
5. [Manuscript & Documents](#-manuscript--documents)
6. [Outputs](#-outputs)

---

## 🔬 Overview
This subdirectory hosts the bash execution script (`run_archaea_pipeline.sh`) that automates our RNA-Seq workflow for Archaea. It utilizes `grabseqs` to directly pull raw SRA data from NCBI, dynamically renames them into logical experimental cohorts (WT vs Mutant), and performs Differential Gene Expression (DGE) using DESeq2.

---

## ⚙️ Workflow Architecture
This pipeline automatically executes the following steps continuously:
1. **Workspace Initialization**: Creates a structured `READemption_analysis` hierarchy explicitly for *Methanosarcina mazei*.
2. **Reference Fetching**: Downloads the genome and annotations (`GCF_000007065.1`) directly via NCBI FTP.
| SRA Accession | Condition | Replicate | Library ID |
| :--- | :--- | :--: | :--- |
| **SRR4018514** | Wild-Type | 1 | `wt_R1` |
| **SRR4018515** | Wild-Type | 2 | `wt_R2` |
| **SRR4018516** | Mutant | 1 | `mut_R1` |
| **SRR4018517** | Mutant | 2 | `mut_R2` |
5. **Core Alignment**: High-performance 11-thread mapping utilizing stringent parameters (`--segemehl_accuracy 95`, `--min_phred_score 20`).
6. **Gene Quantification**: Statistically counts mapping events across CDS, tRNA, and rRNA boundaries.
7. **Differential Expression**: Executes DESeq2 variance tests contrasting `mut` against `wt` conditions.

---

## 🛠 Prerequisites
You must have both the `reademption` and `grabseqs` conda environments installed. The script intelligently jumps between them during execution!

---

## 🚀 Usage Execution
To execute the entirely automated pipeline, invoke the Bash script from this directory:
```bash
bash run_archaea_pipeline.sh
```
*(Note: This complete workflow takes approximately 2 hours on a standard 11-core workstation).*

---

## 🎨 Analytical Visualizations
Key results from the DESeq2 analysis are curated in the [`visualizations/`](./visualizations) directory:
- **[Methanosarcina_MA_Plot.pdf](./visualizations/Methanosarcina_MA_Plot.pdf)**: Displays the distribution of differentially expressed genes.
- **[Methanosarcina_Volcano_Plot.pdf](./visualizations/Methanosarcina_Volcano_Plot.pdf)**: Highlights the most statistically significant genes transitioning between Wild-Type and Mutant states.

---

## 📄 Manuscript & Documents
The `manuscript/` folder contains the final publication and supplementary documents associated with this pipeline:
- `Methanosarcina_RNASeq_Manuscript.pdf` (Main Article)
- `Supplementary_Methods.docx` (Extended Protocols)

> **Note:** Raw FASTQ files, intermediate FASTA, and heavy BAM indexing files are intentionally ignored via `.gitignore` to maintain a lightweight, compliant repository structure.

<br>
<p align="center">Built for Reproducible Bioinformatics</p>
