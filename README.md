# ARM-Toolchain-Setup
Scripts to install dependencies to compile and flash ARM microcontrollers.

## Tested for the following Linux Distros:
1. Ubuntu LTS 18.10

## How to Check if Everything was Installed
If you do not get any errors, call the following lines depending on which script was executed. You should not see any errors that the system can't find the bin files.
1. install-arm-toolchain.sh
```
arm-none-eabi-gcc --version
```
2. install-stlink.sh
```
st-info --version
```
3. install-jlink.sh
```
JLinkExe
```


### Can't Run the Script?
If you cannot see/run the script in the terminal, you need to change the permissions of the bash scripts. Execute the following in the terminal:
```
chmod u+x script.sh
```
