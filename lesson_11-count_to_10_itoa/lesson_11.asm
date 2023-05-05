%include        'functions.asm'

SECTION .text
global  _start

_start:

    mov     ecx, 0

nextNumber:
    inc     ecx
    mov     eax, ecx
    call    iprintLF            ; Call the new int print func (itoa)
    cmp     ecx, 10
    jne     nextNumber

    call quit