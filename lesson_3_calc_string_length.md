# Calculate String Length (32bit assembly)

.data:
- creates the variable with the string and LF

_start:
- Copies the address to the string into both ebx and eax

nextchar:
- Basically a loop that loops through all of the char in the string (and adds one byte to eax).
- When ZF is set it jumps to finished.

finished:
- Subtracts the length of the eax and ebx register, and setsd eax to whatever value is left. This gives us an accurate byte length of teh string that is to be printed.

## Instructions:

Compile:
```
nasm -f elf lesson_3_calc_string_length.asm
```
Link (for 64bit elf_i386 is req):
```
ld -m elf_i386 lesson_3_calc_string_length.o -o lesson_3_calc_string_length
```
Run:
```
./lesson_3_calc_string_length
```