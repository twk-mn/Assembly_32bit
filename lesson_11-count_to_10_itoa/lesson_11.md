# Count to 10 (itoa) (32bit assembly)

## Notes:
The output in Lesson 10 did not actually count to 10 (: instead of actually printing 10). This is because the ASCii that was teh result of the "convertion" of adding 48 to all the values did not give '10' for ASCii 58. Instead we need to print The ASCii 49 and 48 together to get '10'.

### lesson_11.asm

_start:
- Setting the start value (0)

nextNumber:
- incresing ECX by one
- move ECX into EAX to prepare for iprintLF
- Call iprintLF
- Compare the value in ECX to 10
- If the cmp didn't equal to a ZF run nextNumber again

- Call quit to exit

### functions.asm:
iprint:
- Pushing EAX, ECX, EDX, EDI to the stack for later use.
- Moving 0 into ECX to check against later

divideLoop:
- Increase ECX with one byte
- Set EDX to 0
- Move 10 into ESI to then use to divide EAX with
- Divide EAX with 10 (ESI)
- Add 48 to the remainder of EDX
- Push EDX to the stack
- Compare EAX with 0
- If ZF didn't get set run the loop again

printLoop:
- Count down the number that have been put in the stack
- Move ESP into EAX for printing (prep for sprint func)
- Call sprint to print

- Restore ESI, EDX, ECX, EAX from the stack

iprintLF:
- Call the iprint func

- Push EAX to the stack to recover
- Move a LF into EAX (ASCii 0Ah)
- push the LF to the stack
- move stack pointer to EAX for the sprint func
- Call sprint func
- Pop LF and original EAX vale from the stack
- Return

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