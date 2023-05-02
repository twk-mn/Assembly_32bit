# Hello World (32bit assembly)

- Moves a variable with 'Hello World!'-sting with LF char into the registry after memory space have been created (13 bytes).
- Writes it to STOUT file.
- Executes SYS_WRITE to print.
- Calls for the Linux kernel to interupt the program.
- Sets the exit staus code to 0 to indicate that the program ran sucessfully.
- Calls the sys_exit to tell the kernel to end the program.
- Interupt the program with the kernel


## Instructions:

Compile:
```
nasm -f elf lesson_1_2_helloworld.asm
```
Link (for 64bit elf_i386 is req):
```
ld -m elf_i386 lesson_1_2_helloworld.o -o lesson_1_2_helloworld
```
Run:
```
./lesson_1_2_helloworld
```