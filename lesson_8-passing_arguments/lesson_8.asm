%include            'functions.asm'

SECTION .text
global _start

_start:

    pop     ecx         ; The first value on the stacl is the number of arguments

nextArg:
    cmp     ecx, 0h     ; Checks if there are any args left (compares it to NULL)
    jz      noMoreArgs  ; If the cmp returned a ZF it jumps to noMoreArgs.
    pop     eax         ; If Pops the next argumen from the stack
    call    sprintLF    ; Call the LF func in functions.asm
    dec     ecx         ; Decrease ecx with 1 byte
    jmp     nextArg     ; Jumps back and runs nextArg again (now with ecx-1)

noMoreArgs:
    call    quit        ; Stops the program
