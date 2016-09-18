#!/usr/bin/env bash

gdb -batch -ex "run" -ex "py-bt" --args python "$RECIPE_DIR/testing/process_to_debug.py" | tee gdb_output

if [ "$PY_VER" = "3.3"  ]; then
    # 3.3 was the only version whose frame could not be read
    # this test is here mainly to detect when this condition changes
    grep 'frame information optimized out' gdb_output
else
    grep "line 3" gdb_output
    grep "process_to_debug.py" gdb_output
    grep 'os.kill(os.getpid(), signal.SIGSEGV)' gdb_output
fi
