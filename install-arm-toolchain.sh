#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Install ARM compiler
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Installing ARM GNU C/C++ Compiler${NC}"
sudo apt-get install gcc-arm-none-eabi

# Need Binutils for converting and processing the object files built by compiler
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Installing ARM Binutils${NC}"
sudo apt-get install binutils-arm-none-eabi

# Need ARM GDB executables for debugging
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Installing GDB for ARM${NC}"
sudo apt-get install gdb-multiarch

# Update packages
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Updating Packages${NC}"
sudo apt-get update
