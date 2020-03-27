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

AARCH32_TARGET_URL_x86_64='https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf.tar.xz?revision=fed31ee5-2ed7-40c8-9e0e-474299a3c4ac&la=en&hash=76DAF56606E7CB66CC5B5B33D8FB90D9F24C9D20'

# Remove any remnant files
find . -name 'gcc-arm-none-linux-gnueabihf*' -exec rm -r {} \;

echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Retrieving Toolchain from ARM's Website${NC}"
wget -c $AARCH32_TARGET_URL_x86_64 -O gcc-arm-none-linux-gnueabihf.tar.bz2

# Install ARM GNU Toolchain
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Installing ARM GNU Toolchain${NC}"
echo "Extracting..."
mkdir gcc-arm-none-linux-gnueabihf
tar xjf gcc-arm-none-linux-gnueabihf.tar.bz2 -C gcc-arm-none-linux-gnueabihf --strip-components=1

echo "Configuring ~/.bashrc file to export gcc-arm-none-linux-gnueabihf path"

# Get path to the toolchain directory
EXPORT_GCC_PATH="export PATH=\"\$PATH:$(pwd)/gcc-arm-none-linux-gnueabihf/bin\""

# Find if export command already exists. If it already exists for the gcc-arm-none-linux-gnueabihf path, then it should be replaced
sudo grep -i 'gcc-arm-none-linux-gnueabihf/bin' ~/.bashrc && sed -i "/gcc-arm-none-linux-gnueabihf/c\\$EXPORT_GCC_PATH" ~/.bashrc || echo "$EXPORT_GCC_PATH" >> ~/.bashrc
source ~/.bashrc

echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Updating Packages${NC}"
sudo apt-get update

# Check for tool chains
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Checking for Toolchains.\n${ORANGE}IF YOU SEE ERRORS, SOMETHING WENT WRONG!${NC}"
arm-none-linux-gnueabihf-gcc --version
arm-none-linux-gnueabihf-gdb --version

echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Installation Complete${NC}"
