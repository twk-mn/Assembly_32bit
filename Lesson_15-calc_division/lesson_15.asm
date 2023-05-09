%include            'functions.asm'

SECTION .data
msg1    db  ' remainder '           ; Message string to correct the output

SECTION .text
global  _start

_start:

    mov     eax, 0x90
    mov     ebx, 0x9
    div     ebx
    call    iprint
    mov     eax, msg1
    call    sprint
    mov     eax, edx
    call    iprintLF

    call quit