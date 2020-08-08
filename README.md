# STM8S003F3 SDCC example
Lightweight C example of the STM8S003F3 using the Small Device C Compiler (SDCC) without the need for the STM8S/A Standard peripheral library.
Some examples are also compatable with the IAR compiler.

## Setup
To compile and run this SDCC will need to be installed.
On linux, this can be done with the `sudo apt update` and `sudo apt install sdcc`

## Flashing the STM8
The stm8flash utility is used to program the stm8 devices: https://github.com/vdudouyt/stm8flash 
This will need to be compiled. The directory for the executable was placed in:

>/home/*\<your username\>*/tools/stm8flash/

## Make Commands

Typing in the following commands in the development folder:
- `make blink` will compile the blink program to the *./bin/* folder.
- `make tim2` will compile the timer2 interrupt program to the *./bin/* folder.
- `make t2delay` will compile the timer2 delay program to the *./bin/* folder.
- `make burn` command will flash the device depending on the last build.
- `make clean` will clear the binary and the *./bin/* folder.

Depending on your programmer, the makefile may need to be edited.
