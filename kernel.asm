; 
; This program runs in 32-bit protected mode and it is started by the
; bootloader.
; 
bits 32

global start
extern kmain

start:
    cli
    mov esp, stack_space
    call kmain
    hlt

section .bss
    resb 8192                       ; reserve 8KB for stack
    stack_space:
