#!/bin/bash

#SBATCH -N 1
#SBATCH -n 1
#SBATCH --qos=normal
#SBATCH --job-name=HPC_build
#SBATCH --output=HPC_build.out
#SBATCH --time 0-00:30

START=$(date)
python build_network.py
END=$(date)


{ printf "Start: $START \nEnd:   $END\n"; }| mail -r gregglickert@mail.missouri.edu -s "HPC tutorial is done building" gregglickert@mail.missouri.edu

echo "Done running build at $(date)"
