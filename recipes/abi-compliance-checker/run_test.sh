#!/usr/bin/env bash

cp -r $RECIPE_DIR/testing/foo_1.0 .
cp -r $RECIPE_DIR/testing/foo_2.0 .

gcc -shared -g -Og foo_1.0/foo.cpp -o foo_1.0/foo.so
gcc -shared -g -Og foo_2.0/foo.cpp -o foo_2.0/foo.so

abi-dumper foo_1.0/foo.so -o ABI-1.dump -lver 1 -include-paths foo_1.0
abi-dumper foo_2.0/foo.so -o ABI-2.dump -lver 1 -include-paths foo_2.0
bash -i
abi-compliance-checker -l foo -old ABI-1.dump -new ABI-2.dump
