bits 32

section .text
    ; multiboot spec
    align 4
    dd 0x1BADB002                   ; magic number
    dd 0x00                         ; flags
    dd - (0x1BADB002 + 0x00)        ; checksum sum of all 3 should be 0
    
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
