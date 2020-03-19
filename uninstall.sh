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
    echo -e "${DARKGRAY}=======================================${NC}"
    echo -e "${RED}Uninstalling ARM Toolchain${NC}"
    sudo apt purge arm-none-eabi*

    echo -e "${DARKGRAY}=======================================${NC}"
    echo -e "${RED}Uninstalling STLink${NC}"
    rm -r -f stlink

    echo -e "${DARKGRAY}=======================================${NC}"
    echo -e "${RED}Uninstalling JLink${NC}"
    sudo apt purge ^JLink
fi