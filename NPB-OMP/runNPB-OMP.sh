#!/usr/bin/env bash

# Adds required linking and include files to build with custom OpenMP
# runtime library.
# Set environment variable OPENMP_DIR to point to the runtime build directory.

outDir=/app/output
mkdir -p $outDir

outputFile=$outDir/output.txt
touch $outputFile


if [ -z "$1" ]; then
    size=A
    if [ ! -z "$BENCH_SIZE" ]; then
        size=$BENCH_SIZE
    fi
    echo "Running size $size"
    printf "**Running EP**\n"
    /app/ep.$size >> $outputFile
    printf "**Running BT**\n"
    /app//bt.$size >> $outputFile
    printf "**Running CG**\n"
    /app/cg.$size >> $outputFile
    printf "**Running FT**\n"
    /app/ft.$size >> $outputFile
    printf "**Running IS**\n\n"
    /app/is.$size >> $outputFile
    printf "**Running LU**\n"
    /app/lu.$size >> $outputFile
    printf "**Running MG**\n"
    /app/mg.$size >> $outputFile
    printf "**Running SP**\n"
    /app/sp.$size >> $outputFile
    exit 0
else
    echo "Running size $1"
    printf "**Running EP**\n"
    /app/ep.$1 >> $outputFile
    printf "**Running BT**\n"
    /app/bt.$1 >> $outputFile
    printf "**Running CG**\n"
    /app/cg.$1 >> $outputFile
    printf "**Running FT**\n"
    /app/ft.$1 >> $outputFile
    printf "**Running IS**\n\n"
    /app/is.$1 >> $outputFile
    printf "**Running LU**\n"
    /app/lu.$1 >> $outputFile
    printf "**Running MG**\n"
    /app/mg.$1 >> $outputFile
    printf "**Running SP**\n"
    /app/sp.$1 >> $outputFile
fi

