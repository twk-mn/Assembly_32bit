# Linefeeds (32bit assembly)

### lesson_7_[...].asm
.data:
- We now don't add the 0Ah at the end of string when creating the msg1 and msg2 variables

_start:
- Calling the sprintLF func after we have moved the msg1 into EAX.
- sprintLF will do the same as the sprint func did earlier, except it will also append LF.

### lesson_7_functions.asm:
sprintLF:
- Will call the sprint function
- Add 0Ah (LF) onto the stack so we have an address
- Then move the current stack pointer (ESP) into EAX before the sprint func is called
- As ESP points to the address of 0Ah (LF), SYS_WRITE (EAX, 4) is able to use it at the end of the sprint func
- We then just restores the value of EAX

The rest of the lessin_7_function.asm is the same as lesson_5_6
## Instructions:

Compile:
```
nasm -f elf lesson_7_linefeeds.asm
```
Link (for 64bit elf_i386 is req):
```
ld -m elf_i386 lesson_7_linefeeds.o -o lesson_7_linefeeds
```
Run:
```
./lesson_7_linefeeds
```