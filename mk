#!/bin/bash

nasm ${1:?'File name not exist!'} -g -f bin -o boot.bin || { echo 'Error! Exit...'; exit 1; }

read -p 'Open Qemu (S/n)? '

[[ ${REPLY,,} == n ]] && exit


qemu-system-i386 -drive file=boot.bin,format=raw,index=0,if=floppy -boot order=a & disown






