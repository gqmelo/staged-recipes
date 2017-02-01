#!/bin/bash

cmake \
    -DCMAKE_INCLUDE_PATH=$PREFIX/include \
    -DCMAKE_LIBRARY_PATH=$PREFIX/lib \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_INSTALL_LIBDIR=$PREFIX/lib \
    -Dwaffle_has_glx=1
make -j${CPU_COUNT}
make install
