#!/bin/bash
#SBATCH --job-name=fuxi_train
#SBATCH --nodes=1
#SBATCH --output=%x_%j.log
#SBATCH --error=%x_%j.err
#SBATCH --mail-user=quaye@uni-hildesheim.de
#SBATCH --mail-type=ALL
#SBATCH --partition=STUD
#SBATCH --mem=64G
#SBATCH --cpus-per-task=16
#SBATCH --gres=gpu:2

source ~/miniconda3/etc/profile.d/conda.sh
conda activate fuxi_env

export NCCL_SOCKET_IFNAME=lo

CUDA_VISIBLE_DEVICES=0,1 python main.py \
  --gin_config_file=configs/kuairand-27k/linear-4b-l1024-b64x2.gin \
  --master_port=12345


