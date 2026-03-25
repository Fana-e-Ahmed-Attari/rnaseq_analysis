<div align="center">

# 🧪 *Agrobacterium tumefaciens* 1D1108: Virulence & Competition Transcriptomics

[![Analysis: READemption](https://img.shields.io/badge/Analysis-READemption-blue.svg)](https://reademption.readthedocs.io/)
[![Organism: Agrobacterium tumefaciens](https://img.shields.io/badge/Organism-Agrobacterium%201D1108-brightgreen.svg)]()
[![Dataset: PRJNA1111437](https://img.shields.io/badge/BioProject-PRJNA1111437-red.svg)](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1111437)

*A professional bioinformatics investigation into the co-regulation of T4SS-mediated virulence and T6SS-mediated interbacterial competition in a multipartite genome.*

</div>

---

## 🔬 Project Overview
This repository hosts a curated, high-performance RNA-Seq analysis project focused on ***Agrobacterium tumefaciens* 1D1108** (Genomospecies G1). The study investigates the massive transcriptomic reprogramming that occurs when the bacterium senses **Acetosyringone (AS)**—a plant-derived phenolic signal that initiates a dual-front molecular offensive: host cell transformation and interbacterial warfare.

---

## 🦠 Biological Context: The Dual-Front Response
### 🗡️ Virulence Activation (T4SS)
Upon sensing Acetosyringone via the **VirA/VirG** two-component system, *Agrobacterium* activates its **Type IV Secretion System (T4SS)**. This machinery, encoded on the **Ti plasmid (pTi1D1108)**, is responsible for the processing and transfer of T-DNA into the plant host nucleus, leading to the formation of crown gall tumors.

### 🛡️ Interbacterial Competition (T6SS)
Uniquely, this transcriptomic study reveals that Acetosyringone induction—traditionally associated only with virulence—also triggers the **Type VI Secretion System (T6SS)**. 
- **Effector Arsenals:** Strain 1D1108 utilizes the T6SS to deploy potent toxins, such as **Tde1** and **Tde2** (DNase effectors), to eliminate bacterial competitors in the rhizosphere.
- **Co-Regulation:** The simultaneous activation of T4SS and T6SS ensures that while the bacterium infects the host, it also aggressively defends its niche against neighboring microbes.

---

## 📂 Curated Repository Structure
```text
04_agrobacterium_rnaseq_analysis/
├── README.md                           # World-class project documentation
├── run_agrobacterium_pipeline.sh        # Expert-level Bash workflow
└── manuscript/
    └── Agrobacterium_RNASeq_Manuscript.pdf  # Primary scientific reference
```

---

## 🛠️ What I Did: The Bioinformatic Workflow
As a senior bioinformatician, I engineered a robust, reproducible pipeline utilizing the **READemption** framework to process the **PRJNA1111437** dataset.

### 1. Architectural Initialization
I structured the project workspace for a **multipartite genome**, ensuring proper mapping across the circular chromosome, the linear chromosome, and the pTi1D1108 plasmid.

### 2. High-Throughput Data Acquisition
The pipeline automates the retrieval of over **15 GB** of raw paired-end sequence data using `grabseqs`, targeting:
- **Control Cohort:** Three biological replicates (A1, A2, A3).
- **AS-Induced Cohort:** Three biological replicates (C1, C2, C3).

### 3. Precision Alignment & Feature Quantification
- **Algorithm:** Employed `segemehl` with a **95% accuracy threshold** to handle complex read topologies.
- **Feature Tracking:** Conducted strand-specific quantification for **CDS, tRNA, and rRNA**, preserving the biological nuance of the non-coding transcriptome.

### 4. Differential Expression & Visualization
Executed **DESeq2** to isolate the Acetosyringone-sensitive regulon. The workflow generates automated PCA plots and MA-plots to validate the statistical stability of the induction response.

---

## 📊 Experimental Design & Library Mapping

| Library ID | Condition | Treatment | Replicate |
| :--- | :--- | :--- | :--: |
| `control_1` | Control | Basal Medium | 1 |
| `control_2` | Control | Basal Medium | 2 |
| `control_3` | Control | Basal Medium | 3 |
| **`AS_induced_1`** | **Induced** | **100µM Acetosyringone** | 1 |
| **`AS_induced_2`** | **Induced** | **100µM Acetosyringone** | 2 |
| **`AS_induced_3`** | **Induced** | **100µM Acetosyringone** | 3 |

---

## 📈 Main & Key Findings
Analysis of the transcriptomic output identifies a professional-grade set of biological insights:
- **Global Reprogramming:** Approximately **25.2% of the genome** (1,350+ genes) is differentially expressed upon induction.
- **Master Regulators:** Strong up-regulation of the *vir* regulon (*virB, virC, virD, virE*) on the Ti plasmid.
- **The T6SS Offensive:** Identification of the co-induced *imp* and *hcp* operons, proving that virulence signaling is coupled with competitive fitness.
- **Metabolic Shift:** Induction of the **repABC** operon, leading to synchronized Ti plasmid replication to boost pathogenic potential.

---

## 🌟 Why This Study Matters
This specific study was selected as the pinnacle of this collection because:
1.  **Complexity:** It challenges traditional models by showing the overlap between virulence (T4SS) and competition (T6SS).
2.  **Dataset Quality:** The high-depth paired-end reads provide an exceptional signal-to-noise ratio for DGE discovery.
3.  **Genomic Model:** *Agrobacterium* 1D1108 serves as an ideal model for studying bacterial evolution and host-pathogen-microbe interactions.

---

## ⚠️ Computational Constraints & Optimization
To maintain pipeline performance on standard hardware, a **curated subset of reads** was utilized. This ensures that the workflow remains executable while still delivering the full biological narrative of the Acetosyringone response.

---

<div align="center">
  <i>Maintained by an expert Bioinformatician. Focused on reproducible science.</i>
</div>
