; int slen (string message)
; Sting length calc func
slen:
    push    ebx
    mov     ebx, eax

nextchar:
    cmp     eax, ebx
    jz      finished
    inc     eax
    jmp     nextchar

finished:
    sub     eax, ebx
    pop     ebx
    ret


; void sprint (string message)
; Sting printing func
sprint:
    push    edx
    push    ecx
    push    ebx
    push    eax
    call    slen

    mov     edx, eax
    pop     eax

    mov     ecx, eax
    mov     ebx, 1
    move    eax, 4
    int     80h

    pop     ebx
    pop     ecx
    pop     edx
    ret

; void sprintLF (string message)
; String printing with the LF func

sprintLF:
    call    sprint      ; call sptint func

    push    eax         ; perserving EAX by pushing it to the stack while using it here
    move    eax, 0Ah    ; moving 0Ah into EAX (0Ah = LF)
    push    eax         ; pushing the LF to the stack so we then can get the address
    mov     eax, esp    ; moving the stack pointer into EAX for the sprint func
    call    sprint      ; calling the sprint func
    pop     eax         ; removing LF from the stack
    pop     eax         ; "resetting" the value of EAX as it was before the function was called
    ret

; void exit()
; Exit the program and restore resources

quit:
    mov     ebx, 0
    mov     eax, 4
    int     80h
    ret

