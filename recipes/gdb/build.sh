#!/bin/bash

wget https://hg.python.org/cpython/raw-file/$PY_VER/Tools/gdb/libpython.py \
    -O "$SP_DIR/libpython.py"

echo '
python
import gdb
import sys
import os
def setup_python(event):
    import libpython
gdb.events.new_objfile.connect(setup_python)
end
' >> "$PREFIX/etc/gdbinit"

export CFLAGS="-I$PREFIX/include -L$PREFIX/lib"
./configure \
    --prefix="$PREFIX" \
    --with-python \
    --with-system-gdbinit="$PREFIX/etc/gdbinit"
make -j${CPU_COUNT}
make install
