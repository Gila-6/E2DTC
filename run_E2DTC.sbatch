#!/bin/bash
#SBATCH --job-name=runE2DTC          # create a short name for your job
#SBATCH --nodes=1                    # node count
#SBATCH --gpus=1                     # number of GPUs per node(only valid under large/normal partition)
#SBATCH --time=00:10:00              # total run time limit (HH:MM:SS)
#SBATCH --partition=normal           # partition(large/normal/cpu) where you submit
#SBATCH --account=msccsit2024        # account code
#SBATCH --chdir=/home/zzhangjf/E2DTC # directory to execute


module purge                     # clear environment modules inherited from submission
module load Anaconda3/2023.09-0  # load the exact modules required
source activate E2DTC_env        # activate


/home/zzhangjf/.conda/envs/E2DTC_env/bin/python  e2dtc.py -vocab_size 1319 -knearestvocabs "data/geolife-vocab-dist-cell300.h5" -pretrain_epoch 20 -num_layers 3 -learning_rate 0.001 -gamma 0.1 -beta 0.1 -update_interval 1 -n_cluster 12 -cuda 0