# Calculator - atoi [ASCii to Integer] (32bit assembly)

## Notes:
Program that takes multiple arguments from the user and adds the all together.
 
### lesson_16.asm

_start:
- Pop ECX from the stack to see how many args
- Then we pop the program name from the stack (EDX)
- Next we removes 1 from ECX (so we only counts the user args, and ignores the prog name)
- Initialise EDX to store the additions (move 0 into EDX)

nextArg:
- Compares ECX to 0 to see if there are any Args left
- If the zero flag gets set it moves on to noMoreArgs
- Otherwise it popps the next arg from the stack and tehn calls teh atoi func
- What then gets returned from EAX in atoi gets added to the EDX
- We then removes 1 from the ECX (remove the argument that was just added used)
- We then go back to the nextArg again and checks teh next arg

noMoreArgs:
- First moves the data from EDX to EAX before we call iprintLF
- iprintLF is the same functions a previous, and will return the results to the user
- Call quit to exit.

### functions.asm:
Most of the code is the same code as in Lesson 11, 12, 13, 14, and 15. But there a few new functions as well...

atoi:
- We start with pushing EBX, ECX, EDX, and ESI to the stack (so we can use them later)
- We then move EAX into ESI so we can start using the number we want to convert
- Then we initialise EAX and ECX with 0

.multiplyLoop:
- The EBX registry is 32bits, and EBX's 16bit segments is called BX. BX is then split up into BL and BH (BL = lower, BH = higher)
- In this function we first resets both BL and BH to 0
- We then move ESI (the number we want to convert) + 0 (from ECX) into EBX's lower 8bits
- We then compare BL to 48 (the ASCii value for char 0)
- If the zero flag get set, move to .finshed
- Otherwise compare BL to 57 (the ASCii value for 9)
- If BL is greater then 57 jump to .finished

- If BL is 0-9 subtract 48 to get a decimal value of the ASCii value
- Add the the EBX value to EAX
- Move 10 into EBX
- Multiply EBX (10) with EAX (as a decimal placeholder)
- We then run the loop (multiplyLoop agian)

.finished:
- Compare ECX to 0 to see if there are any more aguments
- if equal jump to .restore
- Otherwise move 10 into EBX and divide EAX by 10 (the value in EBX)

.restore:
- Resore the values from EBX, ECX, EDX, and ESI.
- Return to nextArg in lesson_16.asm

## Instructions:

Compile:
```
nasm -f elf lesson_16.asm
```
Link (for 64bit elf_i386 is req):
```
ld -m elf_i386 lesson_16.o -o lesson_16
```
Run:
```
./lesson_16
```