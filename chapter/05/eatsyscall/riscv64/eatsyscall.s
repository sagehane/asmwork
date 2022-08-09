# $ zig build-exe -target riscv64-linux eatsyscall.s
# $ qemu-riscv64 eatsyscall

#.data

EatMsg: .string "Eat at Joe's!\n"
EatLen = . - EatMsg

#.bss

#.text

.global _start

_start:
#nop
li a7,64
li a0,1
la a1,EatMsg
# TODO: Figure out how to use EatLen
li a2,14
ecall

li a7,93
li a0,0
ecall
