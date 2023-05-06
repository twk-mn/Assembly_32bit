# Calculator - Subtraction (32bit assembly)

## Notes:
Program that subtracks a value from another, and prints the result (does not take args from user).

### lesson_13.asm

_start:
- Assigning 90 to EAX
- Assigning 9 to EBX
- Subtracting EBX from EAX
- Call iprintLF
- Call quit

### functions.asm:
The same code as in Lesson 11 & 12.

## Instructions:

Compile:
```
nasm -f elf lesson_13.asm
```
Link (for 64bit elf_i386 is req):
```
ld -m elf_i386 lesson_13.o -o lesson_13
```
Run:
```
./lesson_13
```