#!/bin/bash

start_time=$(date)
echo "Analysis started at: $start_time"

# Activate the READemption environment
# Note: Ensure 'reademption' conda environment exists
# source $(conda info --base)/etc/profile.d/conda.sh
conda activate reademption

# -------------------------------
# Step 1: Create project structure
# -------------------------------
echo "Step 1: Creating project structure..."
reademption create \
  --project_path READemption_analysis \
  --species salmonella="Salmonella Typhimurium"

# -------------------------------
# Step 2: Download reference sequences
# -------------------------------
echo "Step 2: Downloading reference sequences..."
FTP_SOURCE=ftp://ftp.ncbi.nih.gov/genomes/archive/old_refseq/Bacteria/Salmonella_enterica_serovar_Typhimurium_SL1344_uid86645/

wget -O READemption_analysis/input/salmonella_reference_sequences/NC_016810.fa $FTP_SOURCE/NC_016810.fna
wget -O READemption_analysis/input/salmonella_reference_sequences/NC_017718.fa $FTP_SOURCE/NC_017718.fna
wget -O READemption_analysis/input/salmonella_reference_sequences/NC_017719.fa $FTP_SOURCE/NC_017719.fna
wget -O READemption_analysis/input/salmonella_reference_sequences/NC_017720.fa $FTP_SOURCE/NC_017720.fna

# Rename FASTA headers to include accession
sed -i 's/^>/>NC_016810.1 /' READemption_analysis/input/salmonella_reference_sequences/NC_016810.fa
sed -i 's/^>/>NC_017718.1 /' READemption_analysis/input/salmonella_reference_sequences/NC_017718.fa
sed -i 's/^>/>NC_017719.1 /' READemption_analysis/input/salmonella_reference_sequences/NC_017719.fa
sed -i 's/^>/>NC_017720.1 /' READemption_analysis/input/salmonella_reference_sequences/NC_017720.fa

# -------------------------------
# Step 3: Download annotations (GFF)
# -------------------------------
echo "Step 3: Downloading annotations..."
wget -P READemption_analysis/input/salmonella_annotations \
  https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/210/855/GCF_000210855.2_ASM21085v2/GCF_000210855.2_ASM21085v2_genomic.gff.gz

gunzip READemption_analysis/input/salmonella_annotations/GCF_000210855.2_ASM21085v2_genomic.gff.gz

# -------------------------------
# Step 4: Download reads (single-end)
# -------------------------------
echo "Step 4: Downloading reads..."
wget -P READemption_analysis/input/reads http://reademptiondata.imib-zinf.net/InSPI2_R1.fa.bz2
wget -P READemption_analysis/input/reads http://reademptiondata.imib-zinf.net/InSPI2_R2.fa.bz2
wget -P READemption_analysis/input/reads http://reademptiondata.imib-zinf.net/LSP_R1.fa.bz2
wget -P READemption_analysis/input/reads http://reademptiondata.imib-zinf.net/LSP_R2.fa.bz2

# Decompress reads
echo "Decompressing reads..."
bunzip2 READemption_analysis/input/reads/*.bz2

# -------------------------------
# Step 5: Align reads
# -------------------------------
echo "Step 5: Aligning reads..."
reademption align \
  -p 4 \
  --poly_a_clipping \
  --project_path READemption_analysis

# -------------------------------
# Step 6: Generate coverage
# -------------------------------
echo "Step 6: Generating coverage..."
reademption coverage --project_path READemption_analysis

# -------------------------------
# Step 7: Gene quantification
# -------------------------------
echo "Step 7: Quantifying genes..."
reademption gene_quanti --project_path READemption_analysis

# -------------------------------
# Step 8: Differential expression analysis
# -------------------------------
echo "Step 8: Differential expression analysis..."
reademption deseq \
  -l InSPI2_R1,InSPI2_R2,LSP_R1,LSP_R2 \
  -c InSPI2,InSPI2,LSP,LSP \
  -r 1,2,1,2 \
  -s salmonella=InSPI2_R1,InSPI2_R2,LSP_R1,LSP_R2 \
  --project_path READemption_analysis

# -------------------------------
# Step 9: Visualization
# -------------------------------
echo "Step 9: Visualizing results..."
reademption viz_align --project_path READemption_analysis
reademption viz_gene_quanti --project_path READemption_analysis
reademption viz_deseq --project_path READemption_analysis

conda deactivate

end_time=$(date)
echo "Analysis ended at: $end_time"
