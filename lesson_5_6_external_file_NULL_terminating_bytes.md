# Include external files and NULL terminating bytes (32bit assembly)

.data:
- created two variables with strings (msg1 & msg2), and let them end with LF and a NULL terminating byte

_start:
- Move msg1 address into EAX
- Call sprint function in functions.asm
- ...then the same with msg2
- Finish with calling quit in functions.asm

slen:
- calculates the length of the string

...might add more later...

## Instructions:

Compile:
```
nasm -f elf lesson_5_6_external_file_NULL_terminating_bytes.asm
```
Link (for 64bit elf_i386 is req):
```
ld -m elf_i386 lesson_5_6_external_file_NULL_terminating_bytes.o -o lesson_5_6_external_file_NULL_terminating_bytes
```
Run:
```
./lesson_5_6_external_file_NULL_terminating_bytes
```