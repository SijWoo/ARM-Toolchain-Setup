#!/bin/bash

# Install ARM compiler
echo =======================================
echo Installing ARM GNU C/C++ Compiler
sudo apt-get install gcc-arm-none-eabi

# Need Binutils for converting and processing the object files built by compiler
echo =======================================
echo Installing ARM Binutils
sudo apt-get install binutils-arm-none-eabi

# Need ARM GDB executables for debugging
echo =======================================
echo Installing GDB for ARM
sudo apt-get install gdb-multiarch

# Update packages
echo =======================================
echo Updating Packages
sudo apt-get update
