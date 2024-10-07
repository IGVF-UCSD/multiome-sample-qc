#!/bin/bash
script_path=/cellar/users/aklie/data/datasets/igvf_sc-islet_10X-Multiome/bin/sample_annotation/scripts/cellcommander_annotate_RNA.sh
sample=dm11a
input_h5mu=/cellar/users/aklie/data/datasets/igvf_sc-islet_10X-Multiome/results/sample_annotation/$sample/joint/integrate/joint_integrate.h5mu
outdir_path=/cellar/users/aklie/data/datasets/igvf_sc-islet_10X-Multiome/results/sample_annotation/$sample/joint/annotate
cmd='bash $script_path $input_h5mu $outdir_path'
echo -e 'Running command: $cmd'
eval $cmd
