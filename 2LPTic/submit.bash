#!/bin/bash
#PBS -N IC_L67pt51_N4320
#PBS -k oe
#PBS -P iv23
#PBS -l ncpus=4320
#PBS -l mem=17100GB

#PBS -l walltime=02:25:00

#PBS -l storage=gdata/iv23+scratch/iv23

module load openmpi/4.1.2
module load fftw3/3.3.8 hdf5/1.12.1p gsl/2.6

ulimit -c unlimited
cd /home/563/bs8772/models/N-body_ICs/2LPTic/ 

# Run 2LPTic
#mpirunscript="mpirun --mca pml ob1 -x UCX_TLS=ud_x,shm,self -np $PBS_NCPUS"
mpirunscript="mpirun -np $PBS_NCPUS"
executable=./2LPTic
param=L67pt51_N4320.param
#lfs setstripe -c 25 /g/data/iv23/ICs/L35_N2400_5.hdf5
echo ${mpirunscript} ${executable} ${param}
${mpirunscript} ${executable} ${param} > output.log

