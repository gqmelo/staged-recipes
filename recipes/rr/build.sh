#!/bin/bash

mkdir obj
cd obj
cmake -Ddisable32bit=ON ../
make -j${CPU_COUNT}
#make test
make install
