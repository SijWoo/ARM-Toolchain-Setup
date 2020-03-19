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
ARM_TOOLCHAIN_URL='https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2?revision=108bd959-44bd-4619-9c19-26187abf5225&la=en&hash=E788CE92E5DFD64B2A8C246BBA91A249CB8E2D2D'

# Ubuntu
if [[ "$OSTYPE" == "linux-gnu" ]]; then

# Remove any remnant files
find . -name 'gcc-arm*' -exec rm {} \;

# Download tar from ARM's website
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Retrieving Toolchain from ARM's Website${NC}"
wget -c ${ARM_TOOLCHAIN_URL} -O gcc-arm-none-eabi.tar.bz2

# Install ARM GNU Toolchain
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Installing ARM GNU Toolchain${NC}"
sudo apt-get install ./gcc-arm-none-eabi.tar.bz2

# Update packages
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Updating Packages${NC}"
sudo apt-get update


# MAC OSX
elif [[ "$OSTYPE" == "darwin"* ]]; then
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Updating Packages${NC}"
fi

# Check for tool chains
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Checking for Toolchains.\n${ORANGE}IF YOU SEE ERRORS, SOMETHING WENT WRONG!${NC}"
arm-none-eabi-gcc --version
arm-none-eabi-gdb --version
