<div align="center">

# 🧬 Agrobacterium tumefaciens RNA-Seq Analysis

[![Analysis: READemption](https://img.shields.io/badge/Analysis-READemption-blue.svg)](https://reademption.readthedocs.io/)
[![Organism: Agrobacterium tumefaciens](https://img.shields.io/badge/Organism-Agrobacterium%20tumefaciens-brightgreen.svg)]()
[![Data Type: Paired-End RNA-Seq](https://img.shields.io/badge/Data_Type-Paired--End_RNA--Seq-orange.svg)]()

*A comprehensive investigation into the transcriptomic landscape of Agrobacterium tumefaciens 1D1108 under Acetosyringone induction.*

</div>

---

## 🔬 Project Overview
This repository contains a curated RNA-Seq analysis workflow for ***Agrobacterium tumefaciens* 1D1108**. This study focuses on the molecular response of this model phytopathogen when exposed to **Acetosyringone (AS)**—a plant-derived phenolic compound that signals the presence of a wounded host.

---

## 🦠 Project Description
- **Organism:** *Agrobacterium tumefaciens* 1D1108.
- **Study Type:** Paired-End RNA-Seq.
- **Purpose of Analysis:** To characterize the global transcriptional shifts accompanying the transition from a saprophytic to a pathogenic state. Specifically, this analysis tracks the activation of the VirA/VirG two-component system and the subsequent induction of the virulence (*vir*) regulon.

---

## 📂 Repository Structure
The project is organized into a clean, professional hierarchy designed for reproducibility:

```text
04_manuscript_agrobacterium/
├── README.md                           # Project documentation
├── run_agrobacterium_pipeline.sh        # Core bioinformatics workflow
└── manuscript/
    └── Agrobacterium_RNASeq_Manuscript.pdf  # Associated scientific publication
```

---

## ⚙️ Scripts & Workflow
The analysis is automated via the **`run_agrobacterium_pipeline.sh`** script, which executes the following high-level stages:

1.  **Genomic Retrieval:** Automatically fetches the reference genome and GFF3 annotations from NCBI.
2.  **SRA Data Acquisition:** Pulls raw paired-end sequence reads directly from the Sequence Read Archive (SRA).
3.  **READemption Alignment:** Performs high-stringency read mapping across the linear and circular chromosomes and the Ti plasmid.
4.  **Quantification:** Generates genome-wide coverage tracks and counts reads for CDS, tRNA, and rRNA features.
5.  **Differential Expression:** Utilizes DESeq2 to identify genes significantly regulated by Acetosyringone induction.

---

## 📄 Manuscript Summary
The associated manuscript, **"Comparative transcriptomics of Agrobacterium"**, details how *A. tumefaciens* senses environmental cues to initiate infection. Key findings include:
- **Virulence Activation:** Acetosyringone acts as the primary chemical trigger, activating the VirA/VirG system.
- **T-DNA Machinery:** Rapid up-regulation of the *virB*, *virC*, and *virD* operons, which assemble the Type IV Secretion System (T4SS).
- **Ti Plasmid Replication:** The induction of the *repABC* operon increases Ti plasmid copy number, preparing the bacterium for the metabolic demands of host transformation.

---

## 🌟 Why This Paper Was Selected?
This study was selected as a benchmark for this repository due to its **scientific importance** and **pedagogical value**:
- **Model System:** *Agrobacterium* is the cornerstone of plant biotechnology; understanding its transcriptomic control is fundamental for anyone learning RNA-Seq in a microbiology context.
- **Complex Signaling:** The experiment demonstrates a clear, "switch-like" biological response (the *vir* regulon), making it an ideal dataset for validating differential expression pipelines.
- **Multireplicon Genome:** Processing this data requires handling multiple genomic elements (chromosomes and plasmids), adding a layer of professional complexity to the bioinformatics workflow.

---

## ⚠️ Dataset Selection Note
Please note that only a **selected subset of the original datasets** was used for this analysis. This decision was made primarily due to local **computational and storage limitations** associated with processing large-scale paired-end files, while still maintaining enough depth to yield statistically significant biological insights.

---

<div align="center">
  <i>Part of the Curated RNA-Seq Analysis Collection.</i>
</div>
