# Must complete 5_prep_files.ipynb before running this script
# UPDATE ARRAY JOB EACH TIME TO REFLECT NUMBER OF SAMPLES IN INPUT_TSV
script_path=/cellar/users/aklie/data/datasets/igvf_sc-islet_10X-Multiome/bin/3_sample_qc/scripts/joint-integrate.sh
input_tsv=$1
outdir_path=/cellar/users/aklie/data/datasets/igvf_sc-islet_10X-Multiome/results/3_sample_qc

sbatch --job-name=igvf_sc-islet_10X-Multiome_cellcommander_joint-integrate $script_path $input_tsv $outdir_path
