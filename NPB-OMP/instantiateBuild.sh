#!/usr/bin/env bash

# Adds required linking and include files to build with custom OpenMP
# runtime library.
# Set environment variable OPENMP_DIR to point to the runtime build directory.

cd ./config

OMP=''
if [ -z "$1" ]; then
    source ~/.bashrc
    if [ -z "$OPENMP_DIR" ]; then 
        echo "OpenMP directory environment variable not set:"
        echo "Set OPENMP_DIR=<path to OpenMP runtime lib> in your ~/.bashrc.user"
        exit 1
    fi
    OMP=$OPENMP_DIR
else
    OMP=$1
fi

if [ -z "$(grep -E "C_INC = .+? -I$OMP" ./make.def)" ]; then
    echo "OMP include not found adding include"
    sed -i "s|C_INC = .*$|& -I$OMP|" make.def
fi

if [ -z "$(grep -E "CLINKFLAGS =.+?-L$OMP -lomp" ./make.def)" ]; then
    echo "OMP include not found adding include"
    sed -i "s|CLINKFLAGS =.*$|& -L$OMP -lomp|" make.def
fi
exit 0




