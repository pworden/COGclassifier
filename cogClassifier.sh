#!/bin/bash

# Start the cogclassifier conda environment
source /shared/homes/118623/miniconda3/etc/profile.d/conda.sh # Path to conda
conda activate cogclassifier

# ------------------------------------------------------------------------------
# --------------------------------- ALL INPUTS ---------------------------------
queryProteinFasta="/shared/homes/118623/bee_project/cogclassifier/scoaryUniprot.faa"
outputDir="/shared/homes/118623/bee_project/cogclassifier/P_larvae_10-10-23"
# -------------------------------- End All Inputs ------------------------------
# ------------------------------------------------------------------------------


# Create output folder 
if [ -e $outputDir ]; then echo "Folder exists!"; else mkdir $outputDir; echo "Creating folder: $outputDir"; fi

COGclassifier -i $queryProteinFasta -o $outputDir
