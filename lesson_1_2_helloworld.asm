SECTION .data       ; Start data section
msg db  'Hello World!', 0Ah ; Creating the msg variable and adding the hello world string to it, plus LF (new line)

SECTION .text       ; Start text secion
global  _start      ; Setting the label _start as global

_start:             ; Label for entry

    mov edx, 13     ; the number of bytes to write (hellow world string plus LF)
    mov ecx, msg    ; moves the msg memory address into ecx
    mov ebx, 1      ; moving the value 1 into ebx, aka write to STDOUT
    mov eax, 4      ; trigger SYS_WRITE (operation code, opcode, 4)
    int 80h         ; Call for the kernel to run software interupt

    mov ebx, 0      ; Sets the exit status code for sys_exit to 0 (aka the program was successful)
    mov eax, 1      ; Calls for sys_exit to tell the kernel where we want to terminate the program
    int 80h         ; interupts the program


