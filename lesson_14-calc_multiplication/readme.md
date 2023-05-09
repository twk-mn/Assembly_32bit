# Calculator - Multiplication (32bit assembly)

## Notes:
Program that multiplies a value with another, and prints the result (does not take args from the user).
 
### lesson_14.asm

_start:
- Sets EAX to the value 90
- Sets EBX to the value 9 
- Uses the mul instruction to multiply. But this instruction only takes one argument as it will always multiply with EAX. Therefore we give EBX as the argument. The result of the multiplication is then stored in EAX.
- Call iprintLF to then make sure that the value in EAX gets printed to the User.
- Call quit to exit.

### functions.asm:
The same code as in Lesson 11, 12, and 13...

## Instructions:

Compile:
```
nasm -f elf lesson_14.asm
```
Link (for 64bit elf_i386 is req):
```
ld -m elf_i386 lesson_14.o -o lesson_14
```
Run:
```
./lesson_14
```