[BITS 32]

section .multiboot
align 4
    dd 0x1BADB002
    dd 0x00
    dd -(0x1BADB002 + 0x00)

global _start
extern kernel_main

section .text
_start:
    cli
    mov esp, stack_top
    call kernel_main
    hlt

section .bss
    resb 4096
stack_top:
