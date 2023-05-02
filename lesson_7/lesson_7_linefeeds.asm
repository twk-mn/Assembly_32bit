%include        'lesson_7_functions.asm'

SECTION .data
msg1    db      'Hello, brave new world!', 0h           ; No LF needed now as it will be added by thesptingLF func
msg2    db      'This is how we recycle in NASM', 0h    ; Same goes for here

SECTION .text
global _start

_start:

    mov     eax, msg1
    call    sprintLF    ; Calling the LF func which adds the LF after msg1

    mov     eax, msg2
    call    sprintLF    ; Calling the LF func again for the second string

    call quit