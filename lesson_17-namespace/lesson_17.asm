; Lesson 17: Namespace

%include            'functions.asm'

SECTION .data
msg1        db      'Jumping to finish label.', 0h          ; A str msg
msg2        db      'Inside subroutine number: ', 0h        ; A str msg
msg3        db      'Inside subroutine "finished".', 0h     ; A str msg

SECTION .text
global  _start

_start:

subroutineOne:
    mov     eax, msg1           ; Move the address of msg1 into EAX
    call    sprintLF            ; Call the str printing with LF func
    jmp     .finished           ; Jump to the local label inside the subroutineOne scope
    
.finished:
    mov     eax, msg2           ; Move the address of msg2 into EAX
    call    sprint              ; Call the str printing func (without LF)
    mov     eax, 1              ; Move the value 1 onto the stack (to append a 1 to the msg2)
    call    iprintLF            ; Call out int print with LF function (to print EAX)

subroutineTwo:
    mov     eax, msg1           ; Move the address of msg1 into EAX
    call    sprintLF            ; Call the str pring with LF func
    jmp     .finished           ; Jump to the local finished label inside the scope

.finished:
    mov     eax, msg2           ; Move the address of msg2 into EAX
    call    sprint              ; String print func (no LF)
    mov     eax, 2              ; Move the numb 2 into EAX to append to the msg2
    call    iprintLF            ; Call the into print with LF func

    mov     eax, msg1           ; Move the address of msg1 into EAX
    call    sprintLF            ; Call the spr print with LF func
    jmp     finished            ; Jump to the global lable finished

finished:
    mov     eax, msg3           ; Move the address of msg3 into EAX
    call    sprintLF            ; Call the str print with LF func
    call    quit                ; Call the quite func to end the prog