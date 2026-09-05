#!/bin/bash
#SBATCH --output=%x_%j.log
#SBATCH --error=%x_%j.err
#SBATCH --mail-user=quaye@uni-hildesheim.de
#SBATCH --mail-type=ALL
#SBATCH --partition=STUD
#SBATCH --job-name=m_libs
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4          
#SBATCH --mem=16G
#SBATCH --time=00:10:00

source ~/miniconda3/etc/profile.d/conda.sh
conda activate fuxi_env

# Force pip to overwrite the old versions with the new Torch 2.4 wheels
pip install -U ./offline_packages/*.whl

echo "Installation complete!"