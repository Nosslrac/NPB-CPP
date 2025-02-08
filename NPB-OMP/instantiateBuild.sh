#!/usr/bin/env bash

# Adds required linking and include files to build with custom OpenMP
# runtime library.
# Set environment variable OPENMP_LIB and OPENMP_INC to the installed directories


if [[ -z "$OPENMP_LIB" || -z "$OPENMP_INC" ]]; then
    echo "Script requires environment variables OPENMP_LIB and OPENMP_INC to be set"
    exit 1
fi
cd ./config

if [ -z "$(grep -E "C_INC = .+? -I$OPENMP_INC" ./make.def)" ]; then
    echo "OMP include not found adding include"
    sed -i "s|C_INC = .*$|& -I$OPENMP_INC|" make.def
fi

if [ -z "$(grep -E "CLINKFLAGS =.+?-L$OPENMP_LIB -lomp" ./make.def)" ]; then
    echo "OMP include not found adding include"
    sed -i "s|CLINKFLAGS =.*$|& -L$OPENMP_LIB -lomp -Wl,-rpath=$OPENMP_LIB|" make.def
fi
