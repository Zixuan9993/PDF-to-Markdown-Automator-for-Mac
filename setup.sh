#!/bin/bash

# =================================================================
# Project: Intelligent PDF-to-Markdown Automation Suite
# Script: setup.sh (Environment Initialization)
# Author: Zixuan Wang
# Description: Automated setup for MinerU on macOS.
# =================================================================

# --- Color Settings for Better UX ---
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}>>> Starting installation for MinerU Environment...${NC}"

# 1. Check for Homebrew (Required for system libraries)
echo -e "${GREEN}[1/5] Checking Homebrew...${NC}"
if ! command -v brew &> /dev/null; then
    echo -e "${RED}Error: Homebrew not found.${NC}"
    echo "Please install it from https://brew.sh/ first."
    exit 1
fi

# 2. Install System Dependencies via Homebrew
# libmagic and poppler are essential for PDF layout analysis
echo -e "${GREEN}[2/5] Installing system dependencies (libmagic, poppler, tesseract)...${NC}"
brew install wget libmagic poppler tesseract-ocr

# 3. Check for Conda
echo -e "${GREEN}[3/5] Checking Conda...${NC}"
if ! command -v conda &> /dev/null; then
    echo -e "${RED}Error: Conda not found.${NC}"
    echo "Please install Miniconda or Anaconda (e.g., brew install --cask miniconda)."
    exit 1
fi

# Initialize Conda for script interaction
source "$(conda info --base)/etc/profile.d/conda.sh"

# 4. Configure Conda Environment
ENV_NAME="MinerU"
echo -e "${GREEN}[4/5] Configuring Conda environment: ${ENV_NAME}...${NC}"

if conda info --envs | grep -q "${ENV_NAME}"; then
    echo -e "${BLUE}Environment '${ENV_NAME}' already exists. Updating packages...${NC}"
else
    # Create Python environment (Optimized for MinerU compatibility)
    conda create -n ${ENV_NAME} python=3.10 -y
fi

conda activate ${ENV_NAME}

# 5. Install MinerU using high-performance 'uv'
echo -e "${GREEN}[5/5] Installing MinerU using 'uv' for high performance...${NC}"
# Use Aliyun mirror for faster downloads if in China, or remove '-i' if abroad
pip install uv -i https://mirrors.aliyun.com/pypi/simple
uv pip install -U "mineru[all]" -i https://mirrors.aliyun.com/pypi/simple

# --- Initialization of Configuration File ---
# MinerU requires a config file in the home directory to track model paths
CONFIG_FILE="$HOME/magic-pdf.json" 
if [ ! -f "$CONFIG_FILE" ]; then
    echo -e "${BLUE}Initializing default magic-pdf.json at ${CONFIG_FILE}...${NC}"
    echo '{"device-mode":"cpu", "models-dir":"/tmp/models"}' > "$CONFIG_FILE"
    echo -e "${YELLOW}IMPORTANT: Update 'models-dir' in ~/magic-pdf.json with your actual model path.${NC}"
fi

chmod +x "$(dirname "$0")/OCR_pdf.sh"

echo -e "${GREEN}====================================================${NC}"
echo -e "${GREEN}✅ Setup Complete! / 环境配置完成！${NC}"
echo -e "${GREEN}====================================================${NC}"
echo -e "${YELLOW}Next Steps:${NC}"
echo -e "1. Download MinerU model weights from ModelScope/HuggingFace."
echo -e "2. Update the 'shellScriptPath' in main.scpt to match your local folder."
echo -e "3. Drag a PDF onto the exported App to start digitizing!"

