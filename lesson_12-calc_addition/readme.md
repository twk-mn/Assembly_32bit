# Calculator - Addition (32bit assembly)

## Notes:
Program that adds two numbers and prints the result (does not take args from user).

### lesson_11.asm

_start:
- Setting EAX to 90
- Setting EBX to 9
- Add EAX and EBX
- Call the iprintLF func
- Call quit after returning

### functions.asm:
The same code as in Lesson 11.

## Instructions:

Compile:
```
nasm -f elf lesson_12.asm
```
Link (for 64bit elf_i386 is req):
```
ld -m elf_i386 lesson_12.o -o lesson_12
```
Run:
```
./lesson_12
```