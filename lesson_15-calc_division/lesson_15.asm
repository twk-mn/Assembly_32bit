%include            'functions.asm'

SECTION .data
msg1    db  ' remainder '           ; Message string to correct the output

SECTION .text
global  _start

_start:

    mov     eax, 0x90   ; Set EAX to 90
    mov     ebx, 0x9    ; Set EBX to 90
    div     ebx         ; Divide EAX with EBX
    call    iprint      ; call int print func for the qoutient (stored in EAX, EDX gets the remainder)
    mov     eax, msg1   ; move msg1 into EAX
    call    sprint      ; call string print func
    mov     eax, edx    ; move the remainder into EAX
    call    iprintLF    ; Call int print with LF func

    call quit           ; exit