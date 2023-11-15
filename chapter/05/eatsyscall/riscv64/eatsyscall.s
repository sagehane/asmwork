# $ zig build-exe -target riscv64-linux eatsyscall.s
# $ qemu-riscv64 eatsyscall

# `.section` directive for compatibility with GNU as
.section .rodata

EatMsg: .ascii "Eat at Joe's!\n"
# https://github.com/llvm/llvm-project/commit/d045f1d393317962251ba6dc58e3f8edc7e2fd99
# Requires LLVM 17 or higher
EatLen = . - EatMsg

.text

.global _start

_start:
li a7,64
li a0,1
la a1,EatMsg
li a2,Len
ecall

li a7,93
li a0,0
ecall
