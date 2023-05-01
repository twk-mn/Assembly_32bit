%include        'functions.asm'

SECTION .data
msg1    db  'Hello, brave new world', 0Ah, 0h           ; 0h = null terminating byte
msg2    db  'This is how we recycle in NASM.', 0Ah, 0h  ; 0h = null terminating byte

SECTION .text
global _start

_start:
    mov     eax, msg1   ; Adding the address of msg1 to EAX
    call    sprint      ; Call the subroutine 'sprint' in functions.asm 

    mov     eax, msg2   ; Call the subroutine 'sprint' in functions.asm
    call    sprint

    call quit           ; Calls quit  from functions.asm