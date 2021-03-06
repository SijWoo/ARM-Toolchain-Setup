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

read -p "Are you sure? This will uninstall the ARM-Toolchain, JLink, and STLink. [Y/n] " -n 1 -r
echo    # (optional) move to a new line

if [[ $REPLY =~ ^[Yy]$ ]]
then

    # Ubuntu
    if [ "$OSTYPE" == "linux-gnu" ]; then
        echo -e "${DARKGRAY}=======================================${NC}"
        echo -e "${RED}Uninstalling ARM Toolchains${NC}"
        find . -name 'gcc-arm*' -exec rm -r {} \;
        sudo apt purge arm-none-eabi*
        sudo rm /usr/local/bin/arm-none-eabi*
        rm -r gcc-arm-none-eabi
        rm -r gcc-arm-none-linux-gnueabihf
        rm -r gcc-aarch64-none-linux-gnu

        echo -e "${DARKGRAY}=======================================${NC}"
        echo -e "${RED}Uninstalling STLink${NC}"
        rm -r -f stlink

        echo -e "${DARKGRAY}=======================================${NC}"
        echo -e "${RED}Uninstalling JLink${NC}"
        sudo apt purge ^JLink
    
    # MAC OSX
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "TODO: Make script runnable for MACS"
    fi
fi