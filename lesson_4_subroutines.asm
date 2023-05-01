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
    push    ebx         ; pushing the value in EBX onto the stack, this perserves it while EBX is being used in the fuction.
    mov     ebx, eax    ; moving the address into the EBX registry so both EBX and EAX points to the same address.

nextchar:
    cmp     byte [eax], 0   ; compares the byte pointed to by EAX ([] = the actual value) to zero
    jz      finished        ; jump if the ZF = true (zero flag)
    inc     eax             ; if the ZF is not set EAX get increased with one byte
    jmp     nextchar        ; jumps to the top of nextchar, but with EAX + 1 byte

finished:
    sub     eax, ebx        ; EAX = EAX - EBX (the length the msg stored in EAX)
    pop     ebx             ; popping the vlaue stored on the stack back to EBX
    ret                     ; return to the location where the function was called