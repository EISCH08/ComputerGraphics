#!/bin/bash

if [ -z "$ASSIGNMENT1_ROOT" ]
then
    echo "ASSIGNMENT1_ROOT is not set"
    exit 1
fi

export PART3_ROOT=$ASSIGNMENT1_ROOT/part3 && \

# Generate build script
cd $PART3_ROOT && \
if [ ! -d build ]; then
    mkdir build
fi
cd build && \
cmake ../ -DCMAKE_INSTALL_PREFIX=$PART3_ROOT && \

# Build and install the program
make -j4 && \
make install && \

# Run the program
cd ../bin && \
./part3
