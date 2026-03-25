#!/bin/bash

# ==============================================================================
# 🐋 Docker Engine Installation Script (Ubuntu/Linux)
# ==============================================================================
# Description: Automates the setup of Docker Engine, a prerequisite for running
#              the containerized READemption workflow.
# Environment: Linux (Tested on Ubuntu/Debian)
# ==============================================================================

set -e # Exit on error

echo "----------------------------------------------------------------"
echo "🛠️ Starting Docker Installation..."
echo "----------------------------------------------------------------"

# 🔄 Step 1: Update System Packages
echo "[1/4] Updating package index..."
sudo apt-get update -y

# 📦 Step 2: Install Prerequisites
echo "[2/4] Installing transport and certificate dependencies..."
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# 🔑 Step 3: Add Docker's GPG Key and Repository
echo "[3/4] Adding Docker GPG key and official repository..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 🚀 Step 4: Install Docker Engine
echo "[4/4] Installing Docker Engine, Containerd, and Docker Compose..."
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# ✅ Verification
echo "----------------------------------------------------------------"
echo "✅ Docker installed successfully!"
sudo docker --version
echo "----------------------------------------------------------------"