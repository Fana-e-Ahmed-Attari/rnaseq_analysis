<div align="center">

# 🔬 RNA-Seq Analysis Collection

[![Conda](https://img.shields.io/badge/Environment-Conda-lightgrey)](#)
[![Bioinformatics](https://img.shields.io/badge/Domain-Bioinformatics-blue.svg)]()
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

*A curated portfolio of professional bioinformatics workflows, transcriptomic investigations, and peer-reviewed manuscript summaries.*

</div>

---

## 🌟 Repository Overview
Welcome to the **RNA-Seq Analysis Collection**. This repository serves as a centralized hub for high-quality bioinformatics pipelines designed to process both single-end and paired-end RNA-Seq datasets. Each project is meticulously documented, utilizing industry-standard tools like **READemption**, **DESeq2**, and **grabseqs**.

---

## 📂 Curated Projects

| Project Directory | Organism | Study Type | Key Biological Focus |
| :--- | :--- | :--- | :--- |
| **[`01_salmonella_rnaseq_analysis`](./01_salmonella_rnaseq_analysis)** | *Salmonella Typhimurium* | Single-End | End-to-end automated DGE pipeline. |
| **[`02_methanosarcina_rnaseq_analysis`](./02_methanosarcina_rnaseq_analysis)** | *Methanosarcina mazei* | Archaea | Comparative DGE between WT and Mutant strains. |
| **[`03_rhizobium_pairedend_analysis`](./03_rhizobium_pairedend_analysis)** | *Rhizobium tropici* | Paired-End | Symbiotic and abiotic salt stress responses. |
| **[`04_agrobacterium_rnaseq_analysis`](./04_agrobacterium_rnaseq_analysis)** | *Agrobacterium tumefaciens* | Paired-End | Virulence induction via Acetosyringone signaling. |

---

## 🛠️ Methodological Framework
The projects across this repository adhere to a rigorous analytical framework:

1.  **Reproducible Scripting:** Every project includes a `run_*_pipeline.sh` script that automates raw data retrieval, genomic reference fetching, and complete pipeline execution.
2.  **Standardized Tools:** Heavy reliance on the **READemption** toolkit for read alignment (segemehl), coverage calculation, and feature quantification.
3.  **Scientific Context:** Each sub-repository contains the original peer-reviewed manuscript associated with the study, providing essential biological background and validation benchmarks.
4.  **Hardware Optimization:** Pipelines are engineered with memory and storage optimizations to handle large paired-end datasets on standard workstations.

---

## 📄 Organization Policy
- **Naming Conventions:** All files and directories follow strict scientific naming patterns for clarity.
- **Lightweight Storage:** Large intermediate files (FASTQs, BAMs, Indices) are selectively ignored via `.gitignore` to maintain a streamlined repository weight for public consumption.

---

<div align="center">
  <i>Developed and curated by a Bioinformatician & GitHub Maintainer.</i>
</div>
