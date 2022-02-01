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

{ printf "Start: $START \nEnd:   $END\n" & python plot.py & sleep 20 & printf "\n\n" & git diff components/synaptic_models/; }| mail -r gregglickert@mail.missouri.edu -s "HPC tutorial result" -a raster.png gregglickert@mail.missouri.edu

echo "Done running model at $(date)"
