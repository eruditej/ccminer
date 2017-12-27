#!/bin/bash
## configure.sh
## this runs ./configure for you because you wont read it yourself

#--ptxas-options=\"-v -dlcm=cg\""

# If you are trying to make this work on ubuntu < 17, you may need to swith these lines
#extracflags="-march=native -std=c++11 -D_REENTRANT -falign-functions=16 -falign-jumps=16 -falign-labels=16 -fno-strict-aliasing" 
extracflags="-march=native -D_REENTRANT -falign-functions=16 -falign-jumps=16 -falign-labels=16 -fno-strict-aliasing" 

## This assumes you have cuda installed and symlinked 
## This is cuda9 branch and you should be on a newer gcc really. So we use the fPIC option.
## but here is what you should probably use on ubuntu < 17
#CUDA_CFLAGS='-D_FORCE_INLINES -lineno"
CUDA_CFLAGS='-lineno --shared --compiler-options "-Wall -fPIC -fno-strict-aliasing"' \
./configure CXXFLAGS="-O3 $extracflags" --with-cuda=/usr/local/cuda --with-nvml=libnvidia-ml.so

