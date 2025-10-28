        # $ zig build-exe -target riscv64-linux uppercaser2.s

        # $ llvm-mc --arch=riscv32 --filetype=obj uppercaser2.s -o uppercaser2.o
        # $ ld.lld uppercaser2.o -o uppercaser2

        # $ qemu-riscv64 uppercaser2

        .bss

        # Should be RISC-V's page size?
        # The first 12 bits is 0, meaning lui is enough
        BUFFLEN = 4096
        .comm Buff, BUFFLEN

        .text

        .global _start
_start:

read:
        li      a7, 63 # sys_read
        li      a0, 0 # stdin
        lui     a1, %hi(Buff)
        addi    a1, a1,%lo(Buff)
        lui     a2, %hi(BUFFLEN)
        ecall

        beq     zero, a0, done # Quit the program once EOF is reached
prep_scan:
        # a0: Pointer to convert to uppercase
        # t0: Derefrenced byte of t0
        # t1: Value of 'z' - 'a'
        lui     a1, %hi(Buff)
        addi    a1, a1, %lo(Buff)
        mv      a2, a0
        add     a0, a1, a2 # Sum of buffer address and length
        li      t1, 'z' - 'a'
scan:
        addi    a0, a0, -1 # Decrement address

        # Load the byte and store the uppercase value iff 'a' <= t0 <= 'z'.
        lb      t0, 0(a0)
        addi    t0, t0, -'a'
        bgtu    t0, t1, next
store:
        addi    t0, t0, 'A'
        sb      t0, 0(a0)
next:
        bne     a0, a1, scan # Loop until a0 == a1
write:
        li      a7, 64 # sys_write
        li      a0, 1 # stdio
        ecall
        j       read
done:
        li      a7, 93
        li      a0, 0
        ecall
