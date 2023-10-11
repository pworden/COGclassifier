# COGclassifier
Information and additional scripts relevant to the bioinformatic tools "COGclassifier"

## Preparation
**Install COGclassifier**
(https://github.com/moshi4/COGclassifier)

```
# Create the conda environment
conda create --name cogclassifier
# Activate the cogclassifier conda environment
conda activate cogclassifier
# Install cogclassifier into its new environment
conda install -c bioconda -c conda-forge cogclassifier
# OR install with pip
pip install cogclassifier
```

### Get protein identifiers as input

*For adding to Scoary analysis*

- Adding to Scoary analysis: obtain a file of (or copy) protein identifiers from the "goSlims_from_scoary_result" workflow.
    (https://github.com/pworden/goSlims_from_scoary_result)
    The input file "UniprotIdentifiers_input.txt" is in the "diamond_db_result" folder

### Once the protein identifiers are obtained

 - either from the scoary workflow or another source

1. Copy the protein identifiers into the retrieve/ID mapping input box, or input the text file
    (https://www.uniprot.org/id-mapping)
2. Click on the "Completed" link to get results
3. Click on "Download" link
4. Select "download all" and FASTA (canonical) and Compressed 'No'
5. Download the file, change the extension to ".faa", and save the fasta amino acid file to the server.
6. This file will be the input for the COGclassifier script

***
## Run COGclassifier

1. Open the cogClassifier script and set the paths for the input fasta file (.faa) and the output folder.

    ```Bash
    # Set Inputs for script: cogClassifier.sh
    queryProteinFasta="/shared/homes/118623/bee_project/cogclassifier/scoaryUniprot.faa"
    outputDir="/shared/homes/118623/bee_project/cogclassifier/P_larvae_10-10-23"
    ```

***
## Additional Figures for COG Classifier

### Created by the R-script: ***scoaryPieChartGen.R***

1. Open R-studio on your desktop computer
2. Import the "COGclassifier" output TSV (classifier_result.tsv) onto your desktop computer.
3. Open the R-script "scoaryPieChartGen.R" in R-studio (or base-R program).
4. Check that the "ggplot2" R-package is installed and active (see script comments)

    - ggplot2 is required by the script

5. Add the path of the "classifier_result.tsv" to the R-script (scoaryPieChartGen.R) as input.
6. Run the "scoaryPieChartGen.R"
    - This script will generate 1 pie-chart and 1 bar-plot in PDF format
8. The bar-plot and pie-chart PDFs will be saved in the same directory as the input TSV.

## Examples

### Pie Chart output
![classifier_result_pie3](https://github.com/pworden/COGclassifier/assets/92079307/d7039e15-7131-4e36-836e-b505f1dc3677)

### Bar chart output
![classifier_result_bar3](https://github.com/pworden/COGclassifier/assets/92079307/3cd36043-10a6-4aa0-864a-143b456f3a0d)
