#!/bin/bash

if [ -z "$ASSIGNMENT1_ROOT" ]
then
    echo "ASSIGNMENT1_ROOT is not set"
    exit 1
fi

export PART1_ROOT=$ASSIGNMENT1_ROOT/part1 && \

# Generate build script
cd $PART1_ROOT && \
if [ ! -d build ]; then
    mkdir build
fi
cd build && \
cmake ../ -DCMAKE_INSTALL_PREFIX=$PART1_ROOT && \

# Build and install the program
make -j4 && \
make install && \

# Run the program
cd ../bin && \
./part1