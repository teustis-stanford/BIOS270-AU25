# Writeup 4 Pipeline

Name: Tara Eustis

ID: teustis

## Slurm Pipeline
Based on the rnaseq_pipeline_array_depend.sh file, there seems to be a command which tells SLURM to have certain sections depend on others, 
ie SALMON_QUANT=$(sbatch --parsable  --dependency=afterok:$TRIM_GALORE... I assume you could use a similar command to set a DESeq2 which 
uses the same command to make it dependent on the SALMON command finishing. 

## Nextflow Edits
