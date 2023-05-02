# Passing Arguments (32bit assembly)

## Notes:

### lesson_8.asm
_start:
- The top value on the stack is the number of arguments that have been passed.
- We can there by just pop that from the stack and then use that in nextArg to interate through.

nextArg:
- First we compare the number of arguments (ECX) that we popped from the stack with NULL.
- If the ZF get set we jump to noMoreArgs
- If the ZF isn't set we call the sprintLF func in functions.asm
- We then decreases the value (ECX) with one byte.
- Then we run nextArg again.

noMoreArgs:
- calls the quit func

### functions.asm:
- Same as lesson 7...

## Instructions:

Compile:
```
nasm -f elf lesson_8.asm
```
Link (for 64bit elf_i386 is req):
```
ld -m elf_i386 lesson_8.o -o lesson_8
```
Run:
```
./lesson_8
```