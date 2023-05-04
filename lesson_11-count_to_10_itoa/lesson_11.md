# Count to 10 (itoa) (32bit assembly)

## Notes:
The output in Lesson 10 did not actually count to 10 (: instead of actually printing 10). This is because the ASCii that was teh result of the "convertion" of adding 48 to all the values did not give '10' for ASCii 58. Instead we need to print The ASCii 49 and 48 together to get '10'.

### lesson_11.asm

_start:


nextNumber:
- 

### functions.asm:

## Instructions:

Compile:
```
nasm -f elf lesson_11.asm
```
Link (for 64bit elf_i386 is req):
```
ld -m elf_i386 lesson_11.o -o lesson_11
```
Run:
```
./lesson_11
```