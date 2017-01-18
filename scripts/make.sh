#!/usr/bin/env bash

# ESC examples
node convert-examples.js \
../src/main/resources/examples/ESC/AddLoop.java  \
../src/main/resources/examples/ESC/BinarySearch.java  \
../src/main/resources/examples/ESC/CopyArray.java  \
../src/main/resources/examples/ESC/FindFirstZero.java  \
../src/main/resources/examples/ESC/Inverse.java  \
../src/main/resources/examples/ESC/Smallest.java  \
../src/main/resources/examples/ESC/MaybeAdd.java  \
../src/main/resources/ExtendedStaticCheckerMetadata.json > ../src/main/resources/ExtendedStaticCheckerMetadata.ftl
