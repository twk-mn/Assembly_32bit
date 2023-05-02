# Include external files and NULL terminating bytes (32bit assembly)

### lesson_5_6[...].asm
.data:
- created two variables with strings (msg1 & msg2), and let them end with LF and a NULL terminating byte.
- We need the zero byte to be set at the end of the string as otherwise 'cmp byte [eax], 0' will not know that the string (msg1) has ended as they are stored next to eachother in the memory. So it will print msg1+msg2 the first time, and then msg2 again. Kind of need a "space" to tell them apart (the NULL byte).

_start:
- Move msg1 address into EAX
- Call sprint function in lesson_5_6_functions.asm
- ...then the same with msg2
- Finish with calling quit in lesson_5_6_functions.asm

### lesson_5_6_function.asm:

slen:
- Pushes EBX to the stack
- Moves the address in EAX to EBX

nextchar:
- Compare byte size of the value of EAX to 0
- If the cmp results in that the ZF get set it will jump to finished
- Otherwise, it will add 1 byte to EAX.
- Then Jump to the start of nextchar and loop agian until the ZF is set

Sprint:
- Push EDX, ECX, EBX, and EAX to the stack
- Call slen function
- Move the address in EAX into EDX
- Pop EAX from the stack
- Move the address in EAX into ECX
- Write the STDOUT file
- Invoke SYS_WRITE
- Pop EBX, ECX, and EDX from the stack
- return to where 'sprint' was called

quit:
- Exit status code 0
- SYS_EXIT
- return to where 'quit' was called

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