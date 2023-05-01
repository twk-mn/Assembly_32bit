# Subroutines (32bit assembly)

.data:
- created the variable with a string and LF at the end

_start:
- moves the msg address into EAX.
- Calls the function strlen.
- Load the file STOUT and outputs the string.
- Then exits the program.

strlen:
- Stores the value of ebx in the stack while it's being used.
- Moves the address stored in EAX into EBX.

nextchar:
- Compares teh byte pointed at in EAX to 0.
- If ZF is set, jump to finished
- If ZF not set, increadse EAX with 1 byte.
- Jump to nextchar (looping)

finished:
- Gets the value left after subtracting EAX with EBX
- Pop EBX from the stack
- Return back to the location in _start and finish the program


## Instructions:

Compile:
```
nasm -f elf lesson_4_subroutines.asm
```
Link (for 64bit elf_i386 is req):
```
ld -m elf_i386 lesson_4_subroutines.o -o lesson_4_subroutines
```
Run:
```
./lesson_4_subroutines
```