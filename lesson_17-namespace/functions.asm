; inti atoi(int numb)
; ASCii to Interger function (atoi)
atoi:
    push    ebx             ; Save EBX on the stack to restore it after the func
    push    ecx             ; Save ECX on the stack to restore it after the func
    push    edx             ; Save EDX on the stack to restore it after the func
    push    esi             ; Save ESI on the stack to restore it after the func
    mov     esi, eax        ; Move pointer to ESI from EAX (to get the number to convert)
    mov     eax, 0          ; Init EAX with the deci value of 0
    mov     ecx, 0          ; Same as with EAX

.multiplyLoop:              ; . = Local label
    xor     ebx, ebx        ; Resetting both LB and HB of EBX to 0
    mov     bl, [esi+ecx]   ; Move one byte into LB
    cmp     bl, 48          ; Compare LB to the ASCii value of 48 (aka char value 0)
    jl      .finished       ; Jump to local finished if value is less than 48/0
    cmp     bl, 57          ; Compare LH to the ASCii value of 48 (aka char 9)
    jg      .finished       ; Jump to local finished if greater thn 57/9

    sub     bl, 48          ; Convert the str value to decimal interger value
    add     eax, ebx        ; Adde the int value in EBX into EAX
    mov     ebx, 10         ; Move decimal value 10 into EBX
    mul     ebx             ; Multiply EAX with EBX (10) to get a place value
    inc     ecx             ; Increment the value of ECX (the counter reg)
    jmp     .multiplyLoop   ; Continue the loop

.finished:
    cmp     ecx, 0          ; Compare the counter reg value to 0
    je      .restore        ; Jump if ECX was equal to 0 (aka no int args was passed to atoi)
    mov     ebx, 10         ; Move 10 into EBX
    div     ebx             ; Divide EAX with EBX (10)

.restore:
    pop     esi             ; Restore ESI form the stack
    pop     edx             ; Restore EDX form the stack
    pop     ecx             ; Restore ECX form the stack
    pop     ebx             ; Restore EBX form the stack
    ret

; void iprint(int numb)
; Integer printing func (itoa)
iprint:
    push    eax             ; Save EAX on the stack to restore after the func
    push    ecx             ; Save ECX on the stack to restore after the func
    push    edx             ; Save EDX on the stack to restore after the func
    push    esi             ; Save ESX on the stack to restore after the func
    mov     ecx, 0          ; Init the counter of how many bytes to print with the value of 0

.divideLoop:
    inc     ecx             ; count each byte to print (numb of char)
    mov     edx, 0          ; Set EDX to 0
    mov     esi, 10         ; Move 10 into ESI
    idiv    esi             ; Divide EAX with ESI (10)
    add     edx, 48         ; Convert EDX to ASCii (EDX stores the reminder of idiv)
    push    edx             ; Push EDX to the stack
    cmp     eax, 0          ; Checking if the int can be divided more
    jnz     .divideLoop     ; If it can be divided more, loop again

.printLoop:
    dec     ecx             ; Count down each byte that gets put on the stack
    mov     eax, esp        ; Mov the ESP (stack pointer) into EAX to get printed
    call    sprint          ; Call the str print func
    pop     eax             ; Remove the chat that got printed, so it can move to the next
    cmp     ecx, 0          ; Checking if there are any thing left to print
    jnz     .printLoop      ; If tehre are more to print, run printLoop again

    pop     esi             ; Restore ESI from the stack
    pop     edx             ; Restore EDX from the stack
    pop     ecx             ; Restore ECX from the stack
    pop     eax             ; Restore EAX from the stack
    ret

; void iprintLF (int numb)
; Interger printing func with LF (itoa)
iprintLF:
    call    iprint          ; Calll the int print func

    push    eax
    mov     eax, 0Ah
    push    eax
    mov     eax, esp
    call    sprint
    pop     eax
    pop     eax
    ret

; Int slen(str msg)
; String length cal func
slen:
    push    ebx             ; Push EBX to store intil after teh func
    mov     ebx, eax        ; Move EAX into EBX

.nextchar:
    cmp     byte [eax], 0   ; Compare the value of EAX to 0 (byte => smaller, single byte)
    jz      .finished       ; If value of EAX is 0, jump to the local finished label
    inc     eax             ; increase the value of eax with one byte
    jmp     .nextchar       ; Loop nextChar

.finished:
    sub     eax, ebx        ; Subtract EBX from EAX
    pop     ebx             ; Restore EBX from the stack
    ret

; void sptint (Str msg)
; Str print func
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

; void sptintLF(str msg)
; Str print with LF func
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

; void exit
; Exit prog & restore resources
quit:
    mov     ebx, 0
    mov     eax, 1
    int     80h
    ret