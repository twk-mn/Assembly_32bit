%include            'functions.asm'

SECTION .data
msg1        db      'Please enter your name: ', 0h      ; String that asking for user input
msg2        db      'Hello, ', 0h                       ; String that will be printed after user given input (their name)

SECTION .bss
sinput:     resb    255                                 ; Reserves 255 bytes in memory to store the users input sting

SECTION .text
global _start

_start:

    mov     eax, msg1
    call    sprint

    mov     edx, 255        ; Number of bytes to read
    mov     ecx, sinput     ; Reserved space to store input (aka: buffer)
    mov     ebx, 0          ; Read from the STDIN file
    mov     eax, 3          ; Invoke SYS_READ (opcode 3)
    int     80h

    mov     eax, msg2
    call    sprint

    mov     eax, sinput     ; Move the buffer into eax (the input now contains a LF)
    call    sprint          ; Call the print func
    
    call    quit