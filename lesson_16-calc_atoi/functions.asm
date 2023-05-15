; int atoi(integer numb)
; ASCii to Integer func (atoi)
atoi:
    push    ebx             ; save EBX to the stack to restore after func
    push    ecx             ; save ECX to the stack to restore after func
    push    edx             ; save EDX to the stack to restore after func
    push    esi             ; save ESI to the stack to restore after func
    mov     esi, eax        ; Move the pointer in EAX to ESI (the numb to convert)
    mov     eax, 0          ; init EAX with value of 0
    mov     ecx, 0          ; init ECX with value of 0

.multiplyLoop:
    xor     ebx, ebx        ; Resets low/high bytes of EBX to 0
    mov     bl, [esi+ecx]   ; Move single byte into EBX's lower half (bl)
    cmp     bl, 48          ; Compare EBX reg's lower half value against ASCii value 48 (aka char value 0)
    jl      .finished       ; jump if less than to .finished
    cmp     bl, 57          ; Compare EBX reg's lower half value against ASCii value 57 (aka char value 9)
    jg      .finished       ; jump if greater than to .finished

    sub     bl, 48          ; Convert EBX reg's lower half to the decimal representation of the ASCii value
    add     eax, ebx        ; Add EBX the integer value in EAX
    mov     ebx, 10         ; mov 10 into EBX
    mul     ebx             ; multily EAX by EBX to get the place value
    inc     ecx             ; add 1 byte toECX (the counter reg)
    jmp     .multiplyLoop

.finished:
    cmp     ecx, 0          ; Compare ECX reg's value to 0 (the counter register)
    je      .restore        ; jump if equal to 0 (no int args were passed to atoi)
    mov     ebx, 10         ; move 10 into EBX
    div     ebx             ; div EAX by the value of EBX (would be 10 here)

.restore:
    pop     esi             ; Restore ESI from value pushed to the stack
    pop     edx             ; Restore EDX from value pushed to the stack
    pop     ecx             ; Restore ECX from value pushed to the stack
    pop     ebx             ; Restore EBX from value pushed to the stack
    ret

; void iprint(int numb)
; Interger printing func (int to ASCii)
iprint:
    push    eax
    push    ecx
    push    edx
    push    esi
    mov     ecx, 0

divideLoop:
    inc     ecx
    mov     edx, 0
    mov     esi, 10
    idiv    esi
    add     edx, 48
    push    edx
    cmp     eax, 0
    jnz     divideLoop

printLoop:
    dec     ecx
    mov     eax, esp
    call    sprint
    pop     eax
    cmp     ecx, 0
    jnz     printLoop

    pop     esi
    pop     edx
    pop     ecx
    pop     eax
    ret

; void iprint LF(int numb)
; Int printing func with LF (int to ASCii)
iprintLF:
    call    iprint

    push    eax
    mov     eax, 0Ah
    push    eax
    mov     eax, esp
    call    sprint
    pop     eax
    pop     eax
    ret

; int slen(str msg)
; Str length calc func
slen:
    push    ebx
    mov     ebx, eax

nextchar:
    cmp     byte [eax], 0
    jnz     finished
    inc     eax
    jmp     nextchar

finished:
    sub     eax, ebx
    pop     ebx
    ret

; void sprint(str msg)
; Str print func
sprint:
    push    edx
    push    ecx
    push    ebx
    push    eax
    call    slen

    mov     edx, eax
    mov     ebx, 1
    mov     eax, 4
    int     80h

    pop     ebx
    pop     ecx
    pop     edx
    ret

; SprintLF(Str msg)
; Sting print with LF func
sprintLF:
    call    sprint

    push    eax
    mov     eax, 0Ah
    push    eax
    mov     eax, esp
    call    sprint
    pop     eax
    pop     eax
    ret

; Void exit
; Exit prog rest resources
quit:
    mov     ebx, 0
    mov     eax, 4
    int     80h
    ret