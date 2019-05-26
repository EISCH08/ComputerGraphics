#!/bin/bash

if [ -z "$ASSIGNMENT2_ROOT" ]
then
    echo "ASSIGNMENT2_ROOT is not set"
    exit 1
fi

export PART2_ROOT=$ASSIGNMENT2_ROOT/part2 && \

# Generate build script
cd $PART2_ROOT && \
if [ ! -d build ]; then
    mkdir build
fi
cd build && \
cmake ../ -DCMAKE_INSTALL_PREFIX=$PART2_ROOT && \

# Build and install the program
make -j4 && \
make install && \

# Run the program
cd ../bin && \
./part2
