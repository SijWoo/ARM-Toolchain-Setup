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
    echo -e "${CYAN}Retrieving JLink from SEGGER's Website${NC}"
    rm JLink_Linux_x86_64.deb
    wget --post-data="accept_license_agreement=accepted" https://www.segger.com/downloads/jlink/JLink_Linux_x86_64.deb

    echo -e "${DARKGRAY}=======================================${NC}"
    echo -e "${CYAN}Installing JLink${NC}"
    sudo apt-get install ./JLink_Linux_x86_64.deb

# MAC OSX
elif [ "$OSTYPE" == "darwin"* ]; then
    echo "TODO: Make script runnable for MACS"

fi

echo -e "${DARKGRAY}=======================================${NC}"
echo -e "${CYAN}Installation Complete${NC}"
