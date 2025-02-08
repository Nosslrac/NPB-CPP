#!/usr/bin/env bash

# Adds required linking and include files to build with custom OpenMP
# runtime library.
# Set environment variable OPENMP_DIR to point to the runtime build directory.


if [[ -z "$1" || ! -d "$1" ]]; then
    echo "Run script requires an existing writable output directory as argument"
    exit 1
fi

outFile=$1/out.txt
rm -f $outFile
touch $outFile
res=$?

if [[ $res -ne 0 ]]; then
    echo "File system not writable"
    exit 1
fi

if [ -z "$2" ]; then
    size=S
    if [ ! -z "$BENCH_SIZE" ]; then
        size=$BENCH_SIZE
    fi
    echo "Running size $size"
    printf "**Running EP**\n"
    /app/ep.$size >> $outFile
    printf "**Running BT**\n"
    /app/bt.$size >> $outFile
    printf "**Running CG**\n"
    /app/cg.$size >> $outFile
    printf "**Running FT**\n"
    /app/ft.$size >> $outFile
    printf "**Running IS**\n\n"
    /app/is.$size >> $outFile
    printf "**Running LU**\n"
    /app/lu.$size >> $outFile
    printf "**Running MG**\n"
    /app/mg.$size >> $outFile
    printf "**Running SP**\n"
    /app/sp.$size >> $outFile
    exit 0
fi


echo "Running size $2"
printf "**Running EP**\n"
/app/ep.$2 >> $outFile
printf "**Running BT**\n"
/app/bt.$2 >> $outFile
printf "**Running CG**\n"
/app/cg.$2 >> $outFile
printf "**Running FT**\n"
/app/ft.$2 >> $outFile
printf "**Running IS**\n\n"
/app/is.$2 >> $outFile
printf "**Running LU**\n"
/app/lu.$2 >> $outFile
printf "**Running MG**\n"
/app/mg.$2 >> $outFile
printf "**Running SP**\n"
/app/sp.$2 >> $outFile


