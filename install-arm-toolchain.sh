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

# Ubuntu
if [[ "$OSTYPE" == "linux-gnu" ]]; then

# Install ARM compiler
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Installing ARM GNU C/C++ Compiler${NC}"
sudo apt-get install gcc-arm-none-eabi

# Need Binutils for converting and processing the object files built by compiler
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Installing ARM Binutils${NC}"
sudo apt-get install binutils-arm-none-eabi

# Need ARM GDB executables for debugging
# arm-none-eabi-gdb is not supported for Ubuntu 16+ so gdb-multiarch
# needs to be downloaded instead and linked for backwards support if
# applications still uses the arm-none-eabi-gdb name
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Installing GDB for ARM${NC}"
sudo apt-get install gdb-multiarch
sudo ln -s /usr/bin/gdb-multiarch /usr/bin/arm-none-eabi-gdb


# Update packages
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Updating Packages${NC}"
sudo apt-get update

# Check for tool chains
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Checking for Toolchains.\n${ORANGE}IF YOU SEE ERRORS, SOMETHING WENT WRONG${NC}"
arm-none-eabi-gcc --version
arm-none-eabi-gdb --version


# MAC OSX
elif [[ "$OSTYPE" == "darwin"* ]]; then
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Updating Packages${NC}"

fi
