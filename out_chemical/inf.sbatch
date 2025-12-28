#!/bin/bash
#SBATCH --job-name=infgpt
#SBATCH --gpus=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --time=4-00:00
#SBATCH --mail-user=grisha3353@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --output=slurm-%j.out
#SBATCH --error=slurm-%j.err

cd /home/semakin_grisha/nanoGPT/
source ~/.bashrc
conda activate nanogpt
echo "Starting train at $(date)"

# --- OPTIMIZED COMMAND ---
python sample.py \
    --init_from='resume' \
    --out_dir='/home/semakin_grisha/nanoGPT/out_chemical' \
    --start="FILE:/home/semakin_grisha/nanoGPT/out_chemical/prompt.txt" \
    --num_samples=5 \
    --max_new_tokens=300 \
    --temperature=0.5 \
    --device=cuda

echo "Finished at $(date)"
