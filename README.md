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

2. Save the changes and run the **cogClassifier.sh** script
3. Results from cogClassifier will be in the output folder defined by the user



