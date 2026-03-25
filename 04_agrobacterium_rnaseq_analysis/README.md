<div align="center">

# 🧪 *Agrobacterium tumefaciens*: A Deep Dive into Virulence Transcriptomics

[![Bioinformatics Portfolio](https://img.shields.io/badge/Portfolio-Agrobacterium%20Project-blue.svg)]()
[![Analysis: READemption](https://img.shields.io/badge/Analysis-READemption-green.svg)](https://reademption.readthedocs.io/)
[![Organism: Agrobacterium](https://img.shields.io/badge/Organism-A.%20tumefaciens%201D1108-orange.svg)]()

*A comprehensive investigation into the molecular 'on-switch' for plant infection, specifically analyzing the global transcriptomic reprogramming induced by Acetosyringone.*

</div>

---

## 🔬 Project Overview
This project represents a curated bioinformatics study of ***Agrobacterium tumefaciens* 1D1108**. In this study, I processed and analyzed raw RNA-Seq data to characterize how this pathogen prepares for host infection. By contrasting a control environment with one containing **Acetosyringone (AS)**—a chemical signal from wounded plants—this analysis identifies the core "virulence toolkit" the bacterium uses to transform plant cells.

---

## 📜 Why I Selected This Paper & Why It’s the Best Choice
As a beginner in bioinformatics, selecting the right study is crucial for learning. This specific manuscript, **"Comparative transcriptomics of Agrobacterium"**, was chosen for three primary reasons:
1.  **Fundamental Significance:** *Agrobacterium* is the gold standard for studying plant-microbe interactions and the basis of modern plant genetic engineering.
2.  **Biological Clarity:** The response to Acetosyringone is a textbook example of an environmental "trigger" that activates a well-defined set of genes (the *vir* regulon), providing an excellent benchmark for verifying the accuracy of a bioinformatic pipeline.
3.  **Genomic Complexity:** With multiple chromosomes and a pathogenic Ti plasmid, this project offered the perfect challenge to showcase my ability to handle complex, multipartite bacterial genomes.

---

## 🛠️ What I Did: The Bioinformatic Workflow
I engineered a complete, automated pipeline in Bash to handle every stage of the analysis. Here is my high-level methodology:

- **🏗️ Workspace Engineering:** I initialized a professional **READemption** project structure to maintain data integrity throughout the alignment and quantification phases.
- **📥 Automated Data Retrieval:** I utilized the `grabseqs` tool to pull approximately **15 GB** of raw paired-end sequence data directly from the NCBI SRA (BioProject PRJNA1111437).
- **🧬 Genomic Reference Mapping:** I programmed the pipeline to fetch the *Agrobacterium* reference sequences and GFF3 annotations, ensuring all reads were mapped against the correct genomic features (CDS, tRNA, and rRNA).
- **📉 Differential Gene Expression (DGE):** I leveraged **DESeq2** to statistically compare the "Control" vs. "Induced" groups, successfully isolating the genes that are most significantly up-regulated during the early stages of infection.

---

## 📊 Dataset Selection & Optimization
> [!IMPORTANT]
> **Dataset Subsampling Note:**
> Due to significant **computational and hardware storage limitations** on my local environment, I strategically selected a **specific subset of the original sequencing runs**. This selective approach allowed me to maintain a rapid and efficient analysis cycle while still preserving enough statistical power to identify key biological trends (like *vir* gene induction) with high confidence.

---

## 📈 Key Findings of the Study
The analysis revealed several critical insights into *Agrobacterium* biology:
- **Massive Reprogramming:** Nearly **25% of the genome** reacts to the chemical signal, indicating a global shift from growth to virulence.
- **T4SS Induction:** Rapid and coordinated activation of the *virB*, *virC*, and *virD* operons, which form the machinery needed to inject DNA into plant cells.
- **Ti Plasmid Replication:** The induction of the *repABC* system, showing that the bacterium multi-tasks by also preparing its pathogenic plasmid for increased replication.

---

## 📂 Repository Contents
- **`run_agrobacterium_pipeline.sh`**: The master script that automates the entire analysis.
- **`README.md`**: This detailed project documentation.
- **`manuscript/`**: Contains the full scientific paper for biological reference.

---

<div align="center">
  <i>Curated by Fana-e-Ahmed-Attari – Professional Bioinformatics Portfolio.</i>
</div>
