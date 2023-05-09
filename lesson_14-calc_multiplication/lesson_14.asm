; Lesson 15: Calculator (Multiplication) - asmtutor.com
; 2023-05-09
; github.com/twk-mn/Assembly_32bit/
; Fred: github.com/twk-mn

%include            'functions.asm'

SECTION .text
global  _start

_start:

    mov     eax, 90     ; Move the first numb into EAX
    mov     ebx, 9      ; Move the second numb into EBX
    mul     ebx         ; Multiply EAX with EBX (Only accepts one argument, and always multiplies with EAX)
    call    iprintLF    ; Call the int print w/ LF func

    call    quit        ; quit...