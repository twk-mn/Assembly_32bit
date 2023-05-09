# Calculator - Division (32bit assembly)

## Notes:
Program that divides a value with another, and prints the result (does not take args from the user).
 
### lesson_15.asm

_start:
- ...
- Call quit to exit.

### functions.asm:
The same code as in Lesson 11, 12, 13, and 14...

## Instructions:

Compile:
```
nasm -f elf lesson_15.asm
```
Link (for 64bit elf_i386 is req):
```
ld -m elf_i386 lesson_15.o -o lesson_15
```
Run:
```
./lesson_15
```