; $ nasm -f elf64 -g -F stabs eatsyscall.asm
; $ ld -o eatsyscall eatsyscall.o

SECTION .rodata

EatMsg: db "Eat at Joe's!",10
EatLen: equ $-EatMsg

SECTION .text

global _start

_start:
mov rax,1
mov rdi,1
mov rsi,EatMsg
mov rdx,EatLen
syscall

mov rax,60
mov rdi,0
syscall
