#!/usr/bin/env bash

cp -r $RECIPE_DIR/testing/foo_1.0 .
cp -r $RECIPE_DIR/testing/foo_2.0 .

gcc -shared -g -Og -fPIC foo_1.0/foo.cpp -o foo_1.0/libfoo.so.1
gcc -shared -g -Og -fPIC foo_2.0/foo.cpp -o foo_2.0/libfoo.so.2

abi-dumper foo_1.0/libfoo.so.1 -o ABI-1.dump -lver 1
abi-dumper foo_2.0/libfoo.so.2 -o ABI-2.dump -lver 2
abi-compliance-checker -l libfoo -old ABI-1.dump -new ABI-2.dump
