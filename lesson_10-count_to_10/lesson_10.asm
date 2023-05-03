%include        'functions.asm'

SECTION .text
global  _start

_start:

    mov     ecx, 0      ; Moving the start value to ECX (starting at 0)

nextNumber:
    inc     ecx         ; Increasing the value of ECX (start value was 0, so first number will be 1)

    mov     eax, ecx    ; Moving the address of the int into EAX
    add     eax, 48     ; Adding 48 to the number to convert it to ASCii
    push    eax         ; Putting EAX on the stack
    mov     eax, esp    ; Getting the address of the char on the stack
    call    sprintLF    ; Calling the print func

    pop     eax         ; Popping EAX from the stack as we don't need it (cleaning the stack)
    cmp     ecx, 10     ; Comparing ECX to 10 (checking if reach 10 or not)
    jne     nextNumber  ; If ECX was not equal to 10, then jump to nextNumber

    call    quit        ; If ECX was equal, quit