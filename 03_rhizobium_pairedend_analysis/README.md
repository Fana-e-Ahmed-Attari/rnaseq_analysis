<div align="center">
  
# 🧬 Rhizobium tropici Paired-End RNA-Seq Analysis

[![Analysis: READemption](https://img.shields.io/badge/Analysis-READemption-blue.svg)](https://reademption.readthedocs.io/)
[![Organism: Rhizobium tropici](https://img.shields.io/badge/Organism-Rhizobium%20tropici-brightgreen.svg)]()
[![Data Type: Paired-End RNA-Seq](https://img.shields.io/badge/Data_Type-Paired--End_RNA--Seq-orange.svg)]()

*A comprehensive transcriptomic investigation of symbiotic and abiotic stress responses in Rhizobium tropici CIAT 899.*

</div>

---

## 🔬 Overview & Paper Selection

This repository contains the bioinformatics workflows and scripts associated with the transcriptomic analysis of ***Rhizobium tropici* CIAT 899**. 

### 🌟 Why was this paper selected?
This specific manuscript was chosen as a benchmark study because it offers an exceptionally high-quality paired-end RNA-Seq dataset that perfectly contrasts two completely different biological triggers:
1. **A specific chemical inducer:** Apigenin (a flavonoid).
2. **An abiotic environmental stress:** Salt (NaCl).

It serves as an outstanding model for transcriptomic pipeline validation. The dataset demonstrates how a targeted response (NF synthesis genes on a symbiotic plasmid) and a massive global stress response (widespread chromosomal regulation) can converge to activate the exact same symbiotic pathway. It is highly cited and provides an ideal testing ground for differential expression algorithms.

### 📊 Key Findings of the Study
- **Dual Induction:** *R. tropici* CIAT 899 is unique in its ability to synthesize Nod factors (NF) not only under standard flavonoid (apigenin) induction but also under extreme salt stress.
- **Transcriptomic Shifts:** Apigenin induction resulted in a highly targeted response (19 differentially expressed genes, predominantly up-regulated on the symbiotic plasmid). Conversely, salt stress triggered a massive biological shift (790 differentially expressed genes, mostly down-regulated across the main chromosome).
- **Conserved Pathway:** Despite the vastly different global transcriptomic landscapes, 17 key symbiotic genes were up-regulated in both conditions, proving that NF synthesis follows the exact same molecular pathway regardless of the environmental inducer.

---

## 🛠️ Methodology: What I Did

To robustly analyze this dataset and address the severe computational bottlenecks associated with paired-end RNA-Seq read mapping, I designed and executed the following overarching methodology:

1. **Data Preparation**: I structured, validated, and systematically renamed the raw `.fastq.gz` paired-end reads according to their respective environmental treatments (Control, Apigenin, Salt).
2. **Genomic Retrieval**: I programmed the analysis pipelines to automatically fetch the specific *Rhizobium tropici* CIAT 899 reference genome and GFF positional annotations directly from NCBI FTP servers.
3. **Algorithm Optimization**: Recognizing that standard bulk alignment pipelines demand an impractical ~400 GB of intermediate storage for these paired-end datasets, I engineered multiple distinct algorithmic workflows (`.sh` scripts). These include a highly-efficient sequential processing paradigm (`run_memory_optimized_pipeline.sh`) to mitigate storage limits, and an accuracy-maximizing topological read-merge strategy utilizing `bbmap` (`run_bbmerge_pipeline.sh`).
4. **Complete Downstream Execution**: Leveraging the **READemption** toolkit, I effectively generated the final mapped alignments (BAMs), comprehensive genome-wide read coverage profiles, RNA transcript quantifications, and complete DESeq2 differential expression statistics alongside PCA and MA visualizations.

---

## 📂 Repository Structure

The core analysis is executed utilizing the **READemption** pipeline. To handle the immense computational and memory complexities inherent to large paired-end datasets, we have engineered four distinct Bash workflows.

### 📄 1. The Associated Manuscript
- **`manuscript/Rhizobium_RNASeq_Manuscript.pdf`**
  Contains the published, full-text study associated with this transcriptomic analysis for further reading and context.

### ⚙️ 2. The Analytical Pipelines

| SRA Accession | Condition | Treatment | Replicate | Library ID |
| :--- | :--- | :--- | :--: | :--- |
| **SRR3031957** | Control | Basal Medium | 1 | `control_r1` |
| **SRR3031958** | Control | Basal Medium | 2 | `control_r2` |
| **SRR3032151** | Apigenin | Synergistic Induction | 1 | `apigenin_r1` |
| **SRR3062176** | Apigenin | Synergistic Induction | 2 | `apigenin_r2` |
| **SRR3036912** | Salt | Abiotic Stress (NaCl) | 1 | `salt_r1` |
| **SRR3036915** | Salt | Abiotic Stress (NaCl) | 2 | `salt_r2` |

---

<div align="center">
  <i>Developed and maintained for advanced bioinformatics paired-end RNA-Seq applications.</i>
</div>
