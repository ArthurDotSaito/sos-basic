#!/bin/bash

mkdir -p build

PS4='• '
set -x

nasm/src/boot/loader.asm -f bin -o build/loader.bin || exit
cp build/loader.bin build/sos.img
truncate -s 1440k build/sos.img