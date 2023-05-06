%include            'functions.asm'

SECTION .text
global  _start

_start:

    mov     eax, 90     ; move the first numb into EAX
    mov     ebx, 9      ; move the second numb int EBX
    sub     eax, ebx    ; subtrackt EBX from EAX
    call    iprintLF    ; call int print with LF func

    call quit