# Must complete 3_consolidate_AMULET.ipynb before running this script
# UPDATE ARRAY JOB EACH TIME TO REFLECT NUMBER OF SAMPLES IN INPUT_TSV
script_path=scripts/qc_ATAC.sh

# TODO: UPDATE Slurm settings
job_name=qc_ATAC
partition=partition_name
cpus_per_task=1
mem=64G
time="14-00:00:00"
output_path="/path/to/slurm_logs/%x.%A_%a.out"
array="1-1%1"  # Number of samples in input_tsv

# Inputs
input_tsv=$1  # Path to input TSV, passed as argument
config_yaml=/configs/qc_ATAC.yaml
outdir_path=/path/to/qc_ATAC_output  # TODO: Update path

# Cmd
cmd="sbatch \
--job-name=$job_name \
--partition=$partition \
--cpus-per-task=$cpus_per_task \
--mem=$mem \
--time=$time \
--output=$output_path \
--array=$array \
$script_path $input_tsv $config_yaml $outdir_path"
echo -e "Running command:\n$cmd\n"
eval $cmd
