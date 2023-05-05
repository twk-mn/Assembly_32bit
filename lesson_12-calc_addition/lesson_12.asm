%include        'functions.asm'

SECTION .text
global  _start

_start:

    mov     eax, 90         ; Mov the first number we want to add into EAX
    mov     ebx, 9          ; Mov the second number into EBX
    add     eax, ebx        ; Adding EBXto print to EAX
    call    iprintLF        ; Calling the int print with LF func

    call    quit            ; exit