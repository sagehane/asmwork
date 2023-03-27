format ELF64 executable 3 ; `EI_OSABI` for Linux (ELFOSABI_LINUX)

segment readable ; .data

EatMsg db "Eat at Joe's!",10
EatLen = $-EatMsg

segment executable ; .text

entry $
        mov rax,1 ; sys_write
        mov rdi,1 ; set fd to stdout
        mov rsi,EatMsg ; Address of the message
        mov rdx,EatLen ; Length of the message
        syscall

        mov rax,60 ; sys_exit
        mov rdi,0 ; exit code 0
        syscall
