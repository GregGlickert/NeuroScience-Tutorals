#!/bin/bash

#SBATCH -N 1
#SBATCH -n 50
#SBATCH --qos=normal
#SBATCH --job-name=HPC_tut
#SBATCH --output=HPC_run.out
#SBATCH --time 0-00:30

START=$(date)
mpiexec nrniv -mpi -quiet -python run_network.py
END=$(date)

echo "Done running model at $(date)"
