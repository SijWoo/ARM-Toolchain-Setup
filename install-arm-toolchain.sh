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

# If new version is available, update this link
ARM_TOOLCHAIN_URL_x86_64='https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2020q2/gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2?revision=05382cca-1721-44e1-ae19-1e7c3dc96118&la=en&hash=D7C9D18FCA2DD9F894FD9F3C3DC9228498FA281A'
ARM_TOOLCHAIN_URL_MAC='https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2020q2/gcc-arm-none-eabi-9-2020-q2-update-mac.tar.bz2?revision=d0d318de-b746-489f-98b0-9d89648ce910&la=en&hash=9E035CEF6261AA1387D3DCC8B86FA1A20E92B9AB'

# Remove any remnant files
find . -name 'gcc-arm*' -exec rm -r {} \;

## Download tar from ARM's website
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Retrieving Toolchain from ARM's Website${NC}"
# Ubuntu
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    wget -c $ARM_TOOLCHAIN_URL_x86_64 -O gcc-arm-none-eabi.tar.bz2

# MAC OSX
elif [[ "$OSTYPE" == "darwin"* ]]; then
    wget -c $ARM_TOOLCHAIN_URL_MAC -O gcc-arm-none-eabi.tar.bz2
fi

# Install ARM GNU Toolchain
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Installing ARM GNU Toolchain${NC}"
echo "Extracting..."
mkdir gcc-arm-none-eabi
tar xjf gcc-arm-none-eabi.tar.bz2 -C gcc-arm-none-eabi --strip-components=1 --blocking-factor=20

echo "Configuring ~/.bashrc file to export gcc-arm-none-eabi path"

# Get path to the toolchain directory
EXPORT_GCC_PATH="export PATH=\"\$PATH:$(pwd)/gcc-arm-none-eabi/bin\""

# Find if export command already exists. If it already exists for the gcc-arm-none-eabi path, then it should be replaced
sudo grep -i 'gcc-arm-none-eabi/bin' ~/.bashrc && sed -i "/gcc-arm-none-eabi/c\\$EXPORT_GCC_PATH" ~/.bashrc || echo "$EXPORT_GCC_PATH" >> ~/.bashrc
source ~/.bashrc

echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Updating Packages${NC}"

# Ubuntu
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo apt-get update

# MAC OSX
elif [[ "$OSTYPE" == "darwin"* ]]; then
    sudo brew updatez
fi

# Check for tool chains
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Checking for Toolchains.${NC}"
echo -e "${ORANGE}IF YOU SEE ERRORS, SOMETHING WENT WRONG!${NC}"
arm-none-eabi-gcc --version

echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Installation Complete${NC}"
