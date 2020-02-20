# ARM-Toolchain-Setup
Scripts to install dependencies to compile and flash ARM microcontrollers. This 

## Tested for the following Linux Distros:
1. Ubuntu LTS 18.10

## Installation
You must download the compiler so run the install-arm-toolchain.sh script plus any debugger/flash tool.

Jlink can be used for almost any ARM microcontroller. (install-jlink.sh)

Stlink is only meant for STM microcontrollers. (install-stlink.sh)

Please note the bins for stlink is created from [Texane's stlink repo](https://github.com/texane/stlink) and the bins are contained in that directory. Moving the directory could make stlink stop working on your machine unless you edit the path.

### Can't Run the Script?
If you cannot see/run the script in the terminal, you need to change the permissions of the bash scripts. Execute the following in the terminal:
```
chmod u+x script.sh
```

### Updates
Running the bash scripts periodically will keep your toolchains updated. If you need something, create an Issue and I will get the bash scripts working ASAP.

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

## Useful Tools
[VSCode](https://code.visualstudio.com/) is a useful text editor if you are not comfortable with command line debugging. I like vscode since I can look at the registers. Download the cortex-debug extension.

[Sikender's repo](https://github.com/kendiser5000/Visual-Studio-Code-Config-Microcontrollers) holds config files for vscode.