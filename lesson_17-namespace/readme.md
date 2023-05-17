# Namespace (32bit assembly)
This program helps showcase how the flow within the functions, their subroutines (local labels) and the scopes.
## Notes:
Program that takes multiple arguments from the user and adds the all together.
 
## lesson_17.asm
.data:
- Creating three strings that will display throughout the code to indicate when various parts of functions are used

### _start:
##### subroutineOne:
- This just moves msg1 into EAX, calls the sprintLF func and jumps to .finished (the local label)
##### .finished:
- The local label within subroutineOne.
- Moves msg2 into EAX  and calls sprint (str print func without LF)
- Moves 1 into EAX and calls the int print func that includes LF.
- This will print msg2 and the value 1.

##### subroutineTwo:
- Same as what "subroutineOne" did, except it will jump to it's own local label .finished.

##### .finished:
- Very simalar to subroutineOne's local .finished, except it will print msg2 and the value 2.

- It then also moves msg1 into EAX and calls the sprintLF before jumping to the "finished" func.
##### finished:
- This function moves msg3 into EAX and calls the str print function with LF sprintLF.
- Then calls quit

### functions.asm:
A lot of the code in the functions.asm is similar to previous lessons. Except it now uses local labels for many of the functions.

#### atoi:
This function's purpuse is to convert the strings from the user input to integers.
- It starts by moving EBX, ECX, EDX, and ESI to the stack so we can restore the values when done.
- When then move EAX to ESI so we have the number we want to work with
- We then set EAX and ECX to 0
#### .multiplyLoop
This the local label we will loop to convert the ASCii value to an actual integer.
- We first set EBX to 0 with the help of XOR
- We then move one byte to EBX's BL.
- That byte we then compare to 48 (the ASCii value for 0) if the value is less than 48 it will jump to the local .finished
- Then it goes on to compare the BL to 57, which is the ASCii for 9 to see if the value is greater. If it's greate it will move to the local .finished.

- If the value is between 0-9, then it will subtract 48 (we now have the "actual" interger value).
- We then move the value into EAX.
- Next we move 10 into EBX and multiply EAX with EBX (10) to create space.
- we then increase ECX one byte, and run the loop agian.

#### .finished
- We first compare ECX to 0 to see if there are any values left in ECX
- If ECX is equal to 0 we jump to .restore.
If ECX isn't equal to 0 we will move 10 into EBX and divide EAX with EBX (10) to remove the last space that got created the last time we ran the loop otherwise there will be a 0 attached at the end).
#### .restore
- We first restore the values we pushed to the stack before returning to where the atoi func was called.

...and so on...
## Instructions:

Compile:
```
nasm -f elf lesson_17.asm
```
Link (for 64bit elf_i386 is req):
```
ld -m elf_i386 lesson_17.o -o lesson_17
```
Run:
```
./lesson_17
```