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
if [ "$OSTYPE" == "linux-gnu" ]; then

echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Installing git${NC}"
sudo apt-get install git

echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Installing cmake${NC}"
sudo apt-get install cmake

# STLINK needs access to USB but only works with version 1.0-0
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Installing libusb-1.0-0-dev${NC}"
sudo apt-get install libusb-1.0-0-dev

# Update packages
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Updating Packages${NC}"
sudo apt-get update

# Get latest release from Texane's STLink repo
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Cloning STLink${NC}"
git clone https://github.com/texane/stlink.git

echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Switching to Latest Release${NC}"
cd stlink
git pull
version="$(git describe --abbrev=0 --tag)"
git checkout tags/${version}

echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Build STLink${NC}"
make clean
echo -e "Ignore the error if make clean fails. This is just a check to make sure you don't have any pre-existing bins."
make release
cd build/Release
sudo make install
sudo ldconfig

echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Installation Complete${NC}"

# MAC OSX
elif [ "$OSTYPE" == "darwin"* ]; then
echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Installing STLink${NC}"
sudo brew install stlink

echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Installation Complete${NC}"

# POSIX compatibility layer and Linux environment emulation for Windows
elif [ "$OSTYPE" == "cygwin" ]; then
    # IDK yet
    echo ""
fi

done


