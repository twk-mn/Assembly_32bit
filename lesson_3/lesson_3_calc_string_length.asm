SECTION .data
msg db  'Hello, brave new world!', 0Ah  ; Create a variable with a string and LF

SECTION .text
global _start

_start:

    mov ebx, msg        ; Move address of the sting into ebx
    mov eax, ebx        ; Move the address in ebx into eax (they now point to the same thing in memory)

nextchar:               ; 
    cmp byte [eax], 0   ; comapre the byte size of the actual value of what the eax is pointing to in memory agains 0 (zero is a end of string delimiter)
    jz  finished          ; jump (if the ZF, zero flag, is set) to the label finished
    inc eax             ; increment the address in eax with one byte (if the ZF is not set)
    jmp nextchar        ; jumps to finsihed

finished:
    sub eax, ebx        ; eax = eax - ebx. Gives us the number of bytes that might differe from what eax and ebx was set as ealier.
    mov edx, eax        ; eax has the value of the number of bytes for the string.
    mov ecx, msg        ; moving the address of the stinrg into ecx
    mov ebx, 1          ; STDOUT file 
    mov eax, 4          ; SYS_WRITE
    int 80h             ; Call for interuption from kernel

    mov ebx, 0          ; set exit status code to 0
    mov eax, 1          ; SYS_EXIT
    int 80h             ; Call for interuption from kernel
    