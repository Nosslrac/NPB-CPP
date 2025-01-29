#!/usr/bin/env bash

# Adds required linking and include files to build with custom OpenMP
# runtime library.
# Set environment variable OPENMP_DIR to point to the runtime build directory.

cd ./config
source ~/.bashrc.user


sed -i "s|C_INC = .*$|&-I$OPENMP_DIR|" make.def

sed -i "s|CLINKFLAGS =.*$|&-L$OPENMP_DIR -lomp|" make.def
