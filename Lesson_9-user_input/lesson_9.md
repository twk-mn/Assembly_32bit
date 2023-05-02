# User Input (32bit assembly)

## Notes:

### lesson_9.asm
.data:
- Strings asking for users data (msg1)
- Returns Hello <user-input> (msg2)

.bss (Block Started by Symbol)
- Reserves 255 bytes for user input in memory
- 

_start:
-

### functions.asm:
- Same as lesson 7 & 8...

## Instructions:

Compile:
```
nasm -f elf lesson_9.asm
```
Link (for 64bit elf_i386 is req):
```
ld -m elf_i386 lesson_9.o -o lesson_9
```
Run:
```
./lesson_9
```