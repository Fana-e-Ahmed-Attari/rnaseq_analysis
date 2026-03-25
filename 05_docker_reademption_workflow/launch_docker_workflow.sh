#!/bin/bash

# ==============================================================================
# 🐋 Docker Workflow Launcher for READemption
# ==============================================================================
# Description: Orchestrates the containerized RNA-Seq analysis by pulling the
#              image and launching a transient container with volume mappings.
# ==============================================================================

set -e # Exit on error

# 🛠️ Configuration
DOCKER_IMAGE="tillsauerwein/reademption:latest"
WORKSPACE_DIR="$(pwd)"

echo "----------------------------------------------------------------"
echo "🚢 Launching Docker Workflow..."
echo "----------------------------------------------------------------"

# 🔄 Step 1: Pull Docker Image
echo "[1/2] Pulling official READemption image..."
sudo docker pull $DOCKER_IMAGE

# 🚀 Step 2: Run Containerized Analysis
echo "[2/2] Launching interactive container..."
echo "Mapped Volume: $WORKSPACE_DIR -> /home/workspace"

# Launch container and drop into bash
# -v: Maps current directory to /home/workspace inside the container
# -w: Sets the working directory inside the container
sudo docker run -i -t \
    -v "$WORKSPACE_DIR":/home/workspace \
    -w /home/workspace \
    $DOCKER_IMAGE /bin/bash

echo "----------------------------------------------------------------"
echo "👋 Container Exited."
echo "----------------------------------------------------------------"
