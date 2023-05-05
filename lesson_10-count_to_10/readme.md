# Count to 10 (32bit assembly)

## Notes:

### lesson_10.asm

_start:
- Sets the start value (0) on ECX


nextNumber:
- Adds one byte to ECX (first will be 0 -> 1)

- Moving the address to EAX
- To get the correct ASCii we need to convert it simply by adding 48 to the current value
- We then push EAX to the stack while we run the sprintLF

- After returning from sprintLF we pop EAX from the stack
- We then compare ECX and 10 to see if the current number is equal to 10.
- If equal to 10 we will continue to call quit
- Otherwise we will jump to the top of nextNumber (until ECX is equal to 10)

### functions.asm:
- Same as lesson 7 & 8.

## Instructions:

Compile:
```
nasm -f elf lesson_10.asm
```
Link (for 64bit elf_i386 is req):
```
ld -m elf_i386 lesson_10.o -o lesson_10
```
Run:
```
./lesson_10
```