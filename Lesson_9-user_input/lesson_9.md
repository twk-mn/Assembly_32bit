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
- Moves the msg1 into EAX before calling sprint (not sprintLF as previously)
- Moves 255 into EDX to set maximum number of bytes to read.
- Creates a buffer in ECX with sinput (the input from the user)
- Reading from the STDIN file
- Invoe SYS_READ

- Move msg2 into EAX, and then call sprint again (Does not have LF, and will not create new line)

- Move the sinput to EAX, and then call sprint agian (output will be on the same line as the oout put from msg2 that been through sprint)

- Quit.

### functions.asm:
- Same as lesson 7 & 8, but not using all the code (sprintLF is not needed for this program)...

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