#!/bin/bash

# Check if a PDF file parameter is provided
if [ $# -eq 0 ]; then
    echo "Usage: Please drag and drop a PDF file into the terminal."
    exit 1
fi

# Get the full path of the PDF file
pdf_path="$1"

# Check if the file exists
if [ ! -f "$pdf_path" ]; then
    echo "Error: File does not exist - $pdf_path"
    exit 1
fi

# Check if the file is a PDF
if [[ ! "$pdf_path" =~ \.pdf$ ]]; then
    echo "Error: File is not a PDF - $pdf_path"
    exit 1
fi

# Get the directory path of the file
dir_path=$(dirname "$pdf_path")
# Get the filename (without extension)
filename=$(basename "$pdf_path" .pdf)
# Create the output directory path
output_dir="${dir_path}/${filename}_output"

# Activate the Conda environment
# Note: Ensure Conda is initialized in your shell
eval "$(conda shell.bash hook)"
conda activate MinerU

# Run the PDF recognition command using mineru
mineru -p "$pdf_path" -o "$output_dir" -m auto

# Check if the command executed successfully
if [ $? -eq 0 ]; then
    echo "Success: PDF recognition completed!"
    echo "Output directory: $output_dir"
else
    echo "Error: An error occurred during the PDF recognition process."
fi
