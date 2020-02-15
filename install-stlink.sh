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

