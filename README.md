# ARM-Toolchain-Setup
Scripts to install dependencies to compile and flash ARM microcontrollers.

## Tested for the following Linux Distros:
1. Ubuntu LTS 18.04
2. Ubuntu LTS 20.04

## GCC Version
The install-arm-toolchains.sh script will install ARM's 9-2019-q4-major version. This repo will be updated to install the newest release. If there is a new GNU update and the scripts aren't updated, then you can either do the following

## Installation
You must download the compiler plus any debugger/flash tool needed for your board.

The following list shows which scripts corresponds to which device.
1. ARM Cortex-R or Cortex-M microcontrollers : install-arm-toolchain.sh
2. ARM Cortex-A 32-bit microprocessors running Embedded Linux : install-arm-none-linux.sh
3. ARM Cortex-A 64-bit microprocessors running Embedded Linux : install-aarch64-none-linux.sh

Please note the scripts for the ARM Cortex-A microprocessors will only work on an x86_64 machine.

The following list shows which flash/debugger scripts you need to install.
1. Jlink can be used for almost any ARM microcontroller : install-jlink.sh
2. Stlink is only meant for STM microcontrollers : install-stlink.sh

Please note the bins for stlink is created from [Texane's stlink repo](https://github.com/texane/stlink) and the bins are contained in that directory. Moving the directory could make stlink stop working on your machine unless you edit the path.

### Can't Run the Script?
If you cannot see/run the script in the terminal, you need to change the permissions of the bash scripts. Execute the following in the terminal:
```
chmod u+x script.sh
```

### Updates
Running the bash scripts periodically will keep your toolchains updated. If you need something, create an Issue ticket and I will accomodate ASAP.

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

## Uninstallation
To remove all files, run the uninstall.sh script. This will remove everything that all the scripts download.

## Useful Tools
[VSCode](https://code.visualstudio.com/) is a useful text editor if you are not comfortable with command line debugging. I like vscode since I can look at the registers. Download the cortex-debug extension.

[Sikender's repo](https://github.com/kendiser5000/Visual-Studio-Code-Config-Microcontrollers) holds config files for vscode.