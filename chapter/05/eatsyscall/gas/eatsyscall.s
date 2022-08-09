# To execute:
# $ zig run eatsyscall.s
#
# To build the executable:
# $ zig build-exe eatsyscall.s
#
# To build the object file and link it:
# $ zig build-obj eatsyscall.s
# $ zig build-exe eatsyscall.o

#.data

EatMsg: .ascii "Eat at Joe's!\n"
EatLen = . - EatMsg

#.bss

#.text

.global _start

_start:
#nop
mov $1,%rax
mov $1,%rdi
mov $EatMsg,%rsi
mov $EatLen,%rdx
syscall

mov $60,%rax
mov $0,%rdi
syscall
