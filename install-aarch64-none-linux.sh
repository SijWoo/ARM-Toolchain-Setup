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

AARCH64_TARGET_URL_x86_64='https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu.tar.xz?revision=61c3be5d-5175-4db6-9030-b565aae9f766&la=en&hash=0A37024B42028A9616F56A51C2D20755C5EBBCD7'

# Remove any remnant files
find . -name 'gcc-aarch64-none-linux-gnu*' -exec rm -r {} \;

echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Retrieving Toolchain from ARM's Website${NC}"
wget -c $AARCH64_TARGET_URL_x86_64 -O gcc-aarch64-none-linux-gnu.tar.bz2

# Install ARM GNU Toolchain
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Installing ARM GNU Toolchain${NC}"
echo "Extracting..."
mkdir gcc-aarch64-none-linux-gnu
tar bz2 gcc-aarch64-none-linux-gnu.tar.bz2 -C gcc-aarch64-none-linux-gnu --strip-components=1

echo "Configuring ~/.bashrc file to export gcc-aarch64-none-linux-gnu path"

# Get path to the toolchain directory
EXPORT_GCC_PATH="export PATH=\"\$PATH:$(pwd)/gcc-aarch64-none-linux-gnu/bin\""

# Find if export command already exists. If it already exists for the gcc-aarch64-none-linux-gnu path, then it should be replaced
sudo grep -i 'gcc-aarch64-none-linux-gnu/bin' ~/.bashrc && sed -i "/gcc-aarch64-none-linux-gnu/c\\$EXPORT_GCC_PATH" ~/.bashrc || echo "$EXPORT_GCC_PATH" >> ~/.bashrc
source ~/.bashrc

echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Updating Packages${NC}"
sudo apt-get update

# Check for tool chains
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Checking for Toolchains.\n${ORANGE}IF YOU SEE ERRORS, SOMETHING WENT WRONG!${NC}"
aarch64-none-linux-gnu-gcc --version
aarch64-none-linux-gnu-gdb --version

echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Installation Complete${NC}"
