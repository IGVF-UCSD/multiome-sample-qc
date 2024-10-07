# Multiome Sample QC Pipeline
Pipeline documentation: https://docs.google.com/document/d/15cu1opja5_wG0FLlssJsAg9vWi5y9OnHTvg6Qf4ozLI/edit?usp=sharing

0. Prepare metadata for QC
Run the notebook `0_prep_files.ipynb` to prepare the metadata file for the sample QC. These tsv files serve as inputs to the bash scripts that run the QC steps.
TODO: Turn this into a script.

1. RNA qc
Pass in the metadata file for the RNA QC step.
```bash
bash 1_qc_RNA.sh metadata/1_qc_RNA.tsv
```

2. AMULET doublet detection
Pass in the metadata file for the AMULET doublet detection step.
```bash
bash 2_AMULET.sh metadata/2_AMULET.tsv
```

3. Collate doublet calls
Run the notebook `3_consildate_AMULET.ipynb` to collate the doublet calls from AMULET.

4. ATAC qc
Modify the config file `config/4_qc_ATAC.yaml` to specify the location of the collated doublet calls from AMULET.
Pass in the metadata file for the ATAC QC step.
```bash
bash 4_qc_ATAC.sh metadata/4_qc_ATAC.tsv
```

# TODO
- [ ] Turn this into a template repo and link the documentation
- [ ] Turn the metadata preparation into a script
