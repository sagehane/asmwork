# $ zig build-exe -target riscv64-linux eatsyscall.s
# $ qemu-riscv64 eatsyscall

.rodata

EatMsg: .string "Eat at Joe's!\n"
# TODO: Figure out how to calculate offset at assembly-time
#EatLen = . - EatMsg
EatLen = 14

.text

.global _start

_start:
li a7,64
li a0,1
la a1,EatMsg
li a2,EatLen
ecall

li a7,93
li a0,0
ecall
