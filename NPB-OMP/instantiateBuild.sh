#!/usr/bin/env bash

# Adds required linking and include files to build with custom OpenMP
# runtime library.
# Set environment variable OPENMP_DIR to point to the runtime build directory.


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


# LD_LIBRARY_PATH='/apps/Arch/software/libarchive/3.7.4-GCCcore-13.3.0/lib:/apps/Arch/software/cURL/8.7.1-GCCcore-13.3.0/lib:/apps/Arch/software/Clang/18.1.8-GCCcore-13.3.0/lib/x86_64-unknown-linux-gnu:/apps/Arch/software/Clang/18.1.8-GCCcore-13.3.0/lib:/apps/Arch/software/Z3/4.13.0-GCCcore-13.3.0/lib:/apps/Arch/software/Python/3.12.3-GCCcore-13.3.0/lib:/apps/Arch/software/libffi/3.4.5-GCCcore-13.3.0/lib64:/apps/Arch/software/SQLite/3.45.3-GCCcore-13.3.0/lib:/apps/Arch/software/Tcl/8.6.14-GCCcore-13.3.0/lib:/apps/Arch/software/libreadline/8.2-GCCcore-13.3.0/lib:/apps/Arch/software/GMP/6.3.0-GCCcore-13.3.0/lib:/apps/Arch/software/hwloc/2.10.0-GCCcore-13.3.0/lib:/apps/Arch/software/libpciaccess/0.18.1-GCCcore-13.3.0/lib:/apps/Arch/software/libxml2/2.12.7-GCCcore-13.3.0/lib:/apps/Arch/software/numactl/2.0.18-GCCcore-13.3.0/lib:/apps/Arch/software/binutils/2.42-GCCcore-13.3.0/lib:/apps/Arch/software/OpenSSL/3/lib:/apps/Arch/software/bzip2/1.0.8-GCCcore-13.3.0/lib:/apps/Arch/software/ncurses/6.5-GCCcore-13.3.0/lib:/apps/Arch/software/XZ/5.4.5-GCCcore-13.3.0/lib:/apps/Arch/software/zlib/1.3.1-GCCcore-13.3.0/lib:/apps/Arch/software/GCCcore/13.3.0/lib64'
# tmp=''


# while IFS=':' read -ra ADDR; do
#   for i in "${ADDR[@]}"; do
#     if [ -z "$(echo $i | grep -E "OpenSSL")" ]; then
#         tmp=$tmp:$i
#     else
#         echo "Not adding $i"
#     fi
#   done
# done <<< "$LD_LIBRARY_PATH"

# echo $tmp


