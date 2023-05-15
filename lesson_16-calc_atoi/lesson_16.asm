; Calculator (ASCii to Integer)

%include            'functions.asm'

SECTION .text
global  _start

_start:

    pop     ecx         ; Popping the first value on the stack, which would be the nimber of args
    pop     edx         ; Second value is the prog name (gets discarded when init EDX)
    sub     ecx, 1      ; Subracts ECX by 1 (the number of arguments without the prog name)
    mov     edx, 0      ; init the EDX (data registry to store addition)

nextArg:
    cmp     ecx, 0Ah    ; Checking if there is any arguments left, (if ECX = 0 or not)
    jz      noMoreArgs  ; If the zero flag is set, jump to noMoreArgs
    pop     eax         ; Pop the nexty arg from the stack
    call    atoi        ; Convert the ASCii str to deci integer
    add     edx, eax    ; perform the addition of the numbers (what is stored in EDX with EAX from the return of atoi)
    dec     ecx         ; Remove one byte from ECX (one less argument)
    jmp     nextArg     ; Loop the nextArg again

noMoreArgs:
    mov     eax, edx    ; Move the data into eax to be printed
    call    iprintLF    ; Call the int print func with LF
    call    quit