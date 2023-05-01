; int slen(String message)
; Sting length calc function
slen:
    push    ebx         ; push EBX to stack
    mov     ebx, eax    ; add the address EAX point to into EBX

nextchar: 
    cmp byte [eax], 0   ; Compares the byte size of EAX to 0
    jz  finished        ; if ZF jump to finished
    inc eax             ; increase EAX with 1 byte
    jmp nextchar        ; run nextchar again with the new eax size

finished:
    sub eax, ebx        ; EAX = EAX - EBX
    pop ebx             ; pop EBX from stack
    ret                 ; return to where called

; void sprint(String message)
; String printing function
sprint:
    push edx            ; push EDX to stack
    push ecx            ; push ECX to stack
    push ebx            ; push EBX to stack
    push eax            ; push EAX to stack
    call slen           ; Call slen

    mov edx, eax        ; move address for EDX into EDX
    pop eax             ; pop EAX from stack
    
    mov ecx, eax        ; move the address of EAX into ECX
    mov ebx, 1          ; STDOUT file
    mov eax, 4          ; SYS_WRITE
    int 80h             ; kern intrupt

    pop ebx             ; pop EBX from stack
    pop ecx             ; pop ECX from stack
    pop edx             ; pop EDX from stack
    ret                 ; return

; void exit()
; Exit program and restore resources
quit:
    mov ebx, 0          ; return exit status 0
    mov eax, 1          ; SYS_EXIT (opcode 1)
    int 80h             ; kern intrupt
    ret                 ; return