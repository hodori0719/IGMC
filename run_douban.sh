#! /bin/bash

#SBATCH --job-name=ml100k
#SBATCH --time=2:00:00
#SBATCH --mail-user=jhy24@yale.edu
#SBATCH --mail-type=ALL
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=8G
#SBATCH --gpus=1
#SBATCH --partition=gpu

module load CUDA
module load cuDNN
module load miniconda
source activate igmc

for i in $(seq 1 3)  # to run with different seeds
do
  python Main.py --data-name douban --save-appendix --epochs 40 --ARR 0 --seed ${i} --testing --ensemble
done

