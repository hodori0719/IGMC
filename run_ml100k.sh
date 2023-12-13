#! /bin/bash

#SBATCH --job-name=ml100k
#SBATCH --time=2:00:00
#SBATCH --mail-user=jhy24@yale.edu
#SBATCH --mail-type=ALL
#SBATCH --gpus=2

module load CUDA
module load cuDNN
module load miniconda
source activate igmc

for i in $(seq 1 3)  # to run with different seeds
do
  python3 Main.py --data-name ml_100k --save-appendix _mnph200 --data-appendix _mnph200 --epochs 40  --max-nodes-per-hop 200 --seed ${i} --testing --ensemble --dynamic-train
done

