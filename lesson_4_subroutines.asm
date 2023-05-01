SECTION .data
msg db  'Hello, brave new world!', 0Ah

SECTION .text
global _start

_start:
    mov     eax, msg    ; move address of msg into EAX
    call    strlen      ; calling the function strlen to calc string length

    mov     edx, eax    ; moves the results of the length in EDX from EAX
    mov     ecx, msg    ; moving the memory address into ECX
    mov     ebx, 1      ; STDOUt file
    mov     eax, 4      ; SYS_WRITE (opcode 4)
    int     80h         ; kern interupt

    mov     ebx, 0      ; exit status code 0
    mov     eax, 1      ; SYS_EXIT (opcode 1)
    int     80h         ; kern interupt

strlen:                 ; function declaration
    push    ebx         ; pushing the value in ebx onto the stack, this perserves it while ebx is being used in the fuction.
    mov     ebx, eax    ; moving the address into the ebx registry so both ebx and eax points to the same address.

nextchar:
    cmp     byte [eax], 0   ; compares the byte pointed to by eax ([] = the actual value) to zero
    jz      finished        ; jump if the zf = true (zero flag)
    inc     eax             ; if the zf is not set eax get increased with one byte
    jmp     nextchar        ; jumps to the top of nextchar, but with eax + 1 byte

finished:
    sub     eax, ebx        ; eax = eax - ebx (the length the msg stored in eax)
    pop     ebx             ; popping the vlaue stored on the stack back to ebx
    ret                     ; return to the location where the function was called