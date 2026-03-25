#!/bin/bash

# ==============================================================================
# 🧬 Containerized RNA-Seq Analysis Pipeline (Salmonella)
# ==============================================================================
# Description: Automated workflow intended for execution within a READemption
#              Docker container. Processes raw reads to differential expression.
# Study: Salmonella Typhimurium (Tutorial Benchmark)
# ==============================================================================

set -e # Exit on error

echo "----------------------------------------------------------------"
echo "🚀 RNA-Seq Container Pipeline Started at: $(date)"
echo "----------------------------------------------------------------"

# 🏗️ STEP 1: Project Structure Creation
echo "[1/8] Initializing project structure..."
reademption create \
    --project_path READemption_analysis \
    --species salmonella="Salmonella Typhimurium"

# 🧬 STEP 2: Genomic Reference Acquisition
echo "[2/8] Fetching Salmonella reference genome..."
FTP_SOURCE="ftp://ftp.ncbi.nih.gov/genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Typhimurium_SL1344_uid86645/"

wget -q -O READemption_analysis/input/salmonella_reference_sequences/NC_016810.fa $FTP_SOURCE/NC_016810.fna
wget -q -O READemption_analysis/input/salmonella_reference_sequences/NC_017718.fa $FTP_SOURCE/NC_017718.fna

# Rename headers for READemption compatibility
sed -i 's/^>/>NC_016810.1 /' READemption_analysis/input/salmonella_reference_sequences/NC_016810.fa
sed -i 's/^>/>NC_017718.1 /' READemption_analysis/input/salmonella_reference_sequences/NC_017718.fa

# 📥 STEP 3: Annotation Integration
echo "[3/8] Integrating GFF3 annotations..."
wget -q -P READemption_analysis/input/salmonella_annotations \
    https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/210/855/GCF_000210855.2_ASM21085v2/GCF_000210855.2_ASM21085v2_genomic.gff.gz

gunzip -f READemption_analysis/input/salmonella_annotations/*.gz

# 📊 STEP 4: Raw Read Retrieval
echo "[4/8] Fetching raw sequence reads..."
wget -q -P READemption_analysis/input/reads http://reademptiondata.imib-zinf.net/InSPI2_R1.fa.bz2
wget -q -P READemption_analysis/input/reads http://reademptiondata.imib-zinf.net/LSP_R1.fa.bz2

echo "Decompressing libraries..."
bunzip2 -f READemption_analysis/input/reads/*.bz2

# 📉 STEP 5: Read Alignment (segemehl)
echo "[5/8] Aligning reads to reference..."
reademption align \
    -p 4 \
    --poly_a_clipping \
    --project_path READemption_analysis

# 📊 STEP 6: Coverage Track Generation
echo "[6/8] Generating strand-specific coverage tracks..."
reademption coverage --project_path READemption_analysis

# 📉 STEP 7: Gene Quantification
echo "[7/8] Quantifying expression levels (CDS, tRNA, rRNA)..."
reademption gene_quanti --project_path READemption_analysis

# 📊 STEP 8: Differential Expression (DESeq2)
echo "[8/8] Executing DESeq2 analysis and visualization..."
reademption deseq \
    -l InSPI2_R1,LSP_R1 \
    -c InSPI2,LSP \
    -r 1,1 \
    -s salmonella=InSPI2_R1,LSP_R1 \
    --project_path READemption_analysis

# Visualization Automation
reademption viz_align --project_path READemption_analysis
reademption viz_gene_quanti --project_path READemption_analysis
reademption viz_deseq --project_path READemption_analysis

echo "----------------------------------------------------------------"
echo "✅ Workflow Completed Successfully at: $(date)"
echo "----------------------------------------------------------------"