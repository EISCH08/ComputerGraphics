#!/bin/bash

if [ -z "$ASSIGNMENT1_ROOT" ]
then
    echo "ASSIGNMENT1_ROOT is not set"
    exit 1
fi

export PART4_ROOT=$ASSIGNMENT1_ROOT/part4 && \

# Generate build script
cd $PART4_ROOT && \
if [ ! -d build ]; then
    mkdir build
fi
cd build && \
cmake ../ -DCMAKE_INSTALL_PREFIX=$PART4_ROOT && \

# Build and install the program
make -j4 && \
make install && \

# Run the program
cd ../bin && \
./part4
