<div align="center">

# 🧪 *Agrobacterium tumefaciens* 1D1108: Virulence & Competition Transcriptomics

[![Bioinformatics Portfolio](https://img.shields.io/badge/Portfolio-Agrobacterium%20Project-blue.svg)]()
[![Analysis: READemption](https://img.shields.io/badge/Analysis-READemption-green.svg)](https://reademption.readthedocs.io/)
[![Organism: Agrobacterium](https://img.shields.io/badge/Organism-A.%20tumefaciens%201D1108-orange.svg)]()
[![DOI: 10.1099/mgen.0.001485](https://img.shields.io/badge/DOI-10.1099%2Fmgen.0.001485-red.svg)](https://doi.org/10.1099/mgen.0.001485)

*A comprehensive investigation into the transcriptomic landscape of Agrobacterium tumefaciens 1D1108 under Acetosyringone induction.*

</div>

---

## 🔬 Project Overview
This project is a curated bioinformatics study focusing on the transcriptomic response of ***Agrobacterium tumefaciens* 1D1108** (Genomospecies G1) to environmental signals. The analysis is based on the benchmark study: **"Plant-pathogenic *Agrobacterium tumefaciens* strains have diverse type VI effector-immunity pairs and vary in in-planta competitiveness"** ([DOI: 10.1099/mgen.0.001485](https://doi.org/10.1099/mgen.0.001485)).

---

## 📚 Why I Selected This Paper & My Practice Focus
As a beginner in bioinformatics, this paper was selected for its exceptional clarity and multi-factorial design. While the original study rigorously tested four distinct conditions:
1.  **Control** (pH 7.0)
2.  **Acidic Stress** (pH 5.5)
3.  **Acetosyringone (AS) Induction**
4.  ***In-Planta* Infection** (*Nicotiana benthamiana*)

For the purpose of this **educational practice project**, I have strategically focused exclusively on the **Control (Condition A)** vs. **Acetosyringone Induction (Condition C)**. 

### Why this focus?
- **Simplification for Mastering Fundamentals:** By isolating the "Acetosyringone Switch," I can focus on mastering the core READemption pipeline and the fundamental statistics of Differential Gene Expression (DGE) before tackling more complex environmental interactions.
- **Benchmark Discovery:** The Acetosyringone response provides the most dramatic and well-documented biological signal (the *vir* regulon), making it the perfect "Gold Standard" for validating my bioinformatic workflows.

---

## 🛠️ What I Did: The Bioinformatic Workflow
I developed a reproducible Bash-based pipeline to process the paired-end RNA-Seq libraries associated with this study.

- **🏗️ Workspace Engineering:** Initialized a professional READemption environment tailored for the multipartite genome of strain 1D1108 (Circular Chromosome, Linear Chromosome, and Ti Plasmid).
- **📥 Strategic Data Acquisition:** Fetches approximately **15 GB** of raw paired-end sequence data from the SRA, focusing on the Control and AS-Induced biological replicates.
- **🧬 Feature-Aware Mapping:** Conducted read alignment across all genomic elements, specifically quantifying transcripts for **CDS, tRNA, and rRNA** to capture the full breadth of the transcriptional shift.
- **📉 DGE Analysis:** Utilized **DESeq2** to solve for the Acetosyringone-sensitive regulon, identifying genes required for the assembly of the Type IV Secretion System (T4SS).

---

## 📊 Experimental Design & Library Mapping

| SRA Accession | Condition | Treatment | Replicate | Library ID |
| :--- | :--- | :--- | :--: | :--- |
| **SRR29026269** | Control | Basal Medium (pH 7.0) | 1 | `control_1` |
| **SRR29026268** | Control | Basal Medium (pH 7.0) | 2 | `control_2` |
| **SRR29026265** | Control | Basal Medium (pH 7.0) | 3 | `control_3` |
| **SRR29026261** | **Induced** | **Acetosyringone** | 1 | `AS_induced_1` |
| **SRR29026260** | **Induced** | **Acetosyringone** | 2 | `AS_induced_2` |
| **SRR29026259** | **Induced** | **Acetosyringone** | 3 | `AS_induced_3` |

---

---

## 📈 Key Findings & Strategic Insights
Though this project focused on a subset of the data, the findings align with the expert-level conclusions of the source paper:
- **T4SS Induction:** The analysis confirms the intense up-regulation of the *vir* operons (*virB, virC, virD, virE*) required for DNA transfer.
- **Co-Regulation with T6SS:** The study highlights that strain 1D1108 is unique in its divergent **VgrG profile** and highly specific **Tde toxin-immunity pairs**, which are co-induced to maintain competitive fitness during infection.
- **Ti Plasmid Replication:** Observed induction of the *repABC* operon, demonstrating synchronized plasmid copy-number increases upon virulence signaling.

---

## 🎨 Analytical Visualizations
To provide immediate insight into the transcriptomic results, key analytical plots have been curated in the [`visualizations/`](./visualizations) directory:

- **[Agrobacterium_MA_Plot.pdf](./visualizations/Agrobacterium_MA_Plot.pdf)**: Illustrates the relationship between intensity and fold-change, highlighting the significant up-regulation of virulence factors.
- **[Agrobacterium_Volcano_Plot.pdf](./visualizations/Agrobacterium_Volcano_Plot.pdf)**: Visualizes the statistical significance (p-value) against the magnitude of change (log2 fold change), showcasing the robust response to Acetosyringone.

---

## 📂 Repository Contents
- **`run_agrobacterium_pipeline.sh`**: The master script that automates the entire analysis.
- **`README.md`**: This detailed project documentation.
- **`manuscript/`**: Contains the full scientific paper for biological reference.
- **`visualizations/`**: curated analytical plots (MA and Volcano plots).

---

<div align="center">
  <i>Part of the Curated RNA-Seq Analysis Collection.</i>
</div>
