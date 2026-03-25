#!/bin/bash

# ==============================================================================
# 🧬 Agrobacterium tumefaciens RNA-Seq Analysis Pipeline
# ==============================================================================
# Description: Automated workflow for processing paired-end RNA-Seq data
#              investigating the transcriptomic response of Agrobacterium 
#              tumefaciens 1D1108 to Acetosyringone induction.
#
# Biological Context: Acetosyringone (AS) is a plant-derived phenolic signal
#                    that triggers the virulence (vir) system in Agrobacterium.
# ==============================================================================

set -e # Exit on error
eval "$(conda shell.bash hook)"

echo "----------------------------------------------------------------"
echo "🚀 RNA-Seq Pipeline Started at: $(date)"
echo "----------------------------------------------------------------"

# 🛠️ STEP 1: Workspace Initialization
# ----------------------------------------------------------------
echo "[1/6] Initializing READemption project..."
conda activate reademption

reademption create \
    --project_path READemption_analysis \
    --species agrobacterium="Agrobacterium tumefaciens 1D1108"

# 📥 STEP 2: Genomic Reference Acquisition
# ----------------------------------------------------------------
echo "[2/6] Downloading genome and annotation files..."

# Fetch Genome Fasta (ASM366642v1)
wget -q -N https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/003/666/425/GCA_003666425.1_ASM366642v1/GCA_003666425.1_ASM366642v1_genomic.fna.gz
gunzip -f GCA_003666425.1_ASM366642v1_genomic.fna.gz

mv GCA_003666425.1_ASM366642v1_genomic.fna \
   READemption_analysis/input/agrobacterium_reference_sequences/Agro_1D1108.fa

# Fetch GFF Annotation
wget -q -N https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/003/666/425/GCA_003666425.1_ASM366642v1/GCA_003666425.1_ASM366642v1_genomic.gff.gz
gunzip -f GCA_003666425.1_ASM366642v1_genomic.gff.gz

mv GCA_003666425.1_ASM366642v1_genomic.gff \
   READemption_analysis/input/agrobacterium_annotations/Agro_1D1108.gff

# 🧬 STEP 3: Raw Sequence Data Retrieval (SRA)
# ----------------------------------------------------------------
echo "[3/6] Fetching raw SRA datasets..."
conda deactivate
conda activate grabseqs

mkdir -p fastq_raw
cd fastq_raw

# Control libraries (Replicates A1, A2, A3)
grabseqs sra -t 4 SRR29026269 SRR29026268 SRR29026265

# Acetosyringone (AS) Induction libraries (Replicates C1, C2, C3)
grabseqs sra -t 4 SRR29026261 SRR29026260 SRR29026259

cd ..

# 🏷️ STEP 4: Data Organization & Systematic Renaming
# ----------------------------------------------------------------
echo "[4/6] Organizing and renaming FASTQ files..."
cp fastq_raw/*fastq.gz READemption_analysis/input/reads/
cd READemption_analysis/input/reads/

# Renaming to descriptive biological cohorts
# Control Replicates
mv SRR29026269_1.fastq.gz control_1_R1.fastq.gz
mv SRR29026269_2.fastq.gz control_1_R2.fastq.gz
mv SRR29026268_1.fastq.gz control_2_R1.fastq.gz
mv SRR29026268_2.fastq.gz control_2_R2.fastq.gz
mv SRR29026265_1.fastq.gz control_3_R1.fastq.gz
mv SRR29026265_2.fastq.gz control_3_R2.fastq.gz

# AS Induction Replicates
mv SRR29026261_1.fastq.gz AS_induced_1_R1.fastq.gz
mv SRR29026261_2.fastq.gz AS_induced_1_R2.fastq.gz
mv SRR29026260_1.fastq.gz AS_induced_2_R1.fastq.gz
mv SRR29026260_2.fastq.gz AS_induced_2_R2.fastq.gz
mv SRR29026259_1.fastq.gz AS_induced_3_R1.fastq.gz
mv SRR29026259_2.fastq.gz AS_induced_3_R2.fastq.gz

cd ../../../

# 📈 STEP 5: READemption Core Analysis Pipeline
# ----------------------------------------------------------------
echo "[5/6] Executing core READemption pipeline (Alignment, Coverage, Quantification)..."
conda deactivate
conda activate reademption

# Read Mapping (segemehl)
reademption align \
    --project_path READemption_analysis \
    --paired_end \
    --processes 4 \
    --segemehl_accuracy 95 \
    --poly_a_clipping

# Coverage Generation
reademption coverage \
    --project_path READemption_analysis \
    --paired_end \
    --processes 4

# Gene Quantification
reademption gene_quanti \
    --project_path READemption_analysis \
    --paired_end \
    --processes 4 \
    --features CDS,tRNA,rRNA,gene

# 📊 STEP 6: Statistical Analysis & Visualization (DESeq2)
# ----------------------------------------------------------------
echo "[6/6] Running Differential Expression Analysis and Visualization..."

# Differential Expression (Control vs AS Induced)
reademption deseq \
    --project_path READemption_analysis \
    --libs control_1,control_2,control_3,AS_induced_1,AS_induced_2,AS_induced_3 \
    --conditions control,control,control,induced,induced,induced \
    --replicates 1,2,3,1,2,3 \
    --libs_by_species agrobacterium=control_1,control_2,control_3,AS_induced_1,AS_induced_2,AS_induced_3

# Automated Visualization
reademption viz_align --project_path READemption_analysis --paired_end
reademption viz_gene_quanti --project_path READemption_analysis --paired_end
reademption viz_deseq --project_path READemption_analysis

conda deactivate

echo "----------------------------------------------------------------"
echo "✅ Pipeline Finished Successfully at: $(date)"
echo "----------------------------------------------------------------"