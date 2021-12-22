#!/bin/bash
#SBATCH -o slurm.%j.out
#SBATCH -p compute
#SBATCH --qos=normal
#SBATCH -J yyc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --mail-type=end


module load matlab/R2021a

matlab -nodesktop -nosplash -nodisplay -r main

echo 'finished!'
