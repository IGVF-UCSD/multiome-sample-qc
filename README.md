# Multiome Sample QC Pipeline
Pipeline documentation: https://docs.google.com/document/d/15cu1opja5_wG0FLlssJsAg9vWi5y9OnHTvg6Qf4ozLI/edit?usp=sharing

# Configuration
We are using the classic bioinformatic definition of a pipeline here to be a bunch of scripts that should be run sequentially. The current version of the pipeline expects a SLURM cluster to be available for running the jobs. The pipeline code needs to be copied and modified to match the user's cluster set-up and their dataset of interest

# Running the pipeline
0. Prepare metadata for QC
Run the notebook `0_prep_files.ipynb` to prepare the metadata file for the sample QC. These tsv files serve as inputs to the bash scripts that run the QC steps.

1. RNA qc
Modify configs/qc_RNA.yaml to your desired parameters and the 1_qc_RNA.sh script to match the user's cluster set-up and dataset of interest. Then pass in the metadata file for the RNA QC step:
```bash
bash 1_qc_RNA.sh metadata/1_qc_RNA.tsv
```

2. AMULET doublet detection
Modify the 2_AMULET.sh script to match the user's cluster set-up and dataset of interest. Then pass in the metadata file for the AMULET doublet detection step.
```bash
bash 2_AMULET.sh metadata/2_AMULET.tsv
```

3. Collate doublet calls
Run the notebook `3_consildate_AMULET.ipynb` to collate the doublet calls from AMULET.

4. ATAC qc
Modify the config file `config/4_qc_ATAC.yaml` to specify the location of the collated doublet calls from AMULET (and other parameters as necessary). Then pass in the metadata file for the ATAC QC step.
```bash
bash 4_qc_ATAC.sh metadata/4_qc_ATAC.tsv
```

# TODO
- [ ] Turn the metadata preparation into a script
- [ ] Brainstorm a way to make this pipeline more configurable (no dependency on SLURM or user mods to code)
