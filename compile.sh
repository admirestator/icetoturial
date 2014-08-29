#! /bin/bash

function build_slice() {
    cd slice && make install -j5 && cd ..
}

function build_main() {
    cd build && cmake .. && make install -j5 && cd ..
}

function compile_main() {
    cd build && make install -j5 && cd ..
    ls -l bin
}

function compile() {
    build_slice
    build_main
    ls -l bin
}

function cleanall() {
    cd slice && make clean && cd ..
    rm -rf build bin/*
    rm -rf include/Printer.h src/Printer.cpp
}

function help_info() {
    echo "Command Help"

    echo "./compile.sh [OPTION]"
    echo "default   just make the ICE related files."
    echo "[compile] just build the project initial."
    echo "[rebuild] rebuild all project."
    echo "[clean]   clean all compiled files."
    echo "[help]    show this help info."
}



#echo 'GG' $# $1 $2 $2

mkdir -p build bin
#if [ '1' -lt "$#" ]; then
#    help_info
#    exit -1
#fi

case $1 in
    'compile')
        compile
        ;;
    'rebuild')
        mkdir -p build
        rebuild
        ;;
    'clean')
        cleanall
        ;;
    'help')
        help_info
        ;;
    *)
        compile_main
        ;;
esac
