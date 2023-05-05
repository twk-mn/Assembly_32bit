; void iprint (Int numb)
; Int printing func (itoa)

iprint:
    push    eax         ; preserver EAX on the stack to be recovered after fun runs
    push    ecx         ; preserver ECX on the stack to be recovered after fun runs
    push    edx         ; preserver EDX on the stack to be recovered after fun runs
    push    esi         ; preserver ESI on the stack to be recovered after fun runs
    mov     ecx, 0      ; counter of how many bytes we need to print in the end

divideLoop:
    inc     ecx         ; count each byte to print, numb of char
    mov     edx, 0      ; empty EDX
    mov     esi, 10     ; move 10 into ESI
    idiv    esi         ; divide EAX with ESI
    add     edx, 48     ; Convert EDX to ASCii (EDX stores the remainder afrer idiv of ESI)
    push    edx         ; push the converted EDX on the stack
    cmp     eax, 0      ; Chech if it's possible to div the value further (is it 0?)
    jnz     divideLoop  ; If the ZF not get set, jump to top of divideLoop

printLoop:
    dec     ecx         ; Count down each byte that has been put on the stack
    mov     eax, esp    ; Move stack pointer into EAX for printing
    call    sprint      ; Call the print func
    pop     eax         ; pop the top char from the stack to move to the next
    cmp     ecx, 0      ; check if tehre are anything else to print (any bytes left?)
    jnz     printLoop   ; If the ZF doesn't get set, run the loop again

    pop     esi         ; restore ESI form the stack
    pop     edx         ; restore EDX form the stack
    pop     ecx         ; restore ECX form the stack
    pop     eax         ; restore EAX form the stack
    ret

; void iprintLF(Int numb)
; Int printing func with LF (itoa)
iprintLF:
    call    iprint      ; Call the int print func

    push    eax         ; push EAX to the stack while so we can recover it after using EAX in this func
    mov     eax, 0Ah    ; move the ASCii for LF into EAX
    push    eax         ; Push the LF onto the stack so we can get the address
    mov     eax, esp    ; Move the current stack pointer into EAX for the sprint func
    call    sprint      ; call sprint func
    pop     eax         ; remove LF from stack
    pop     eax         ; restore the original value for EAX
    ret

; int slen(Str msg)
; Str len calc func

slen:
    push    ebx
    mov     ebx, eax

nextchar:
    cmp     byte [eax], 0
    jz      finished
    inc     eax
    jmp     nextchar

finished:
    sub     eax, ebx
    pop     ebx
    ret

; void sprint(str msg)
;Str printing func

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
    mov     eax, 4
    int     80h

    pop     ebx
    pop     ecx
    pop     edx
    ret

; void sprintLF
; Str print w LF func
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

; void exit()
; exit the prog and reset resources
quit:
    mov     ebx, 0
    mov     eax, 1
    int     80h
    ret