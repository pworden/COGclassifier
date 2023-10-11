#!/bin/bash

#PBS -l ncpus=16
#PBS -l mem=64GB
#PBS -l walltime=48:00:00

# Start the cogclassifier conda environment
source /shared/homes/118623/miniconda3/etc/profile.d/conda.sh # Path to conda
conda activate cogclassifier

# ------------------------------------------------------------------------------
# --------------------------------- ALL INPUTS ---------------------------------
queryProteinFasta="/shared/homes/118623/bee_project/cogclassifier/scoary.faa"
outputDir="/shared/homes/118623/bee_project/cogclassifier/COG_out"
# -------------------------------- End All Inputs ------------------------------
# ------------------------------------------------------------------------------


# Create output folder 
if [ -e $outputDir ]; then echo "Folder exists!"; else mkdir $outputDir; echo "Creating folder: $outputDir"; fi

COGclassifier -i $queryProteinFasta -o $outputDir
