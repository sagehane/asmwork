This is just a repo to track my experience reading
[Assembly Language Step By Step, Third Edition.](http://www.duntemann.com/assembly.html).

The code from the book targets Linux for i386 with NASM and I plan to add support for other targets
for practice. The instructions assume the usage of an x86_64 Linux.

Planned targets include:
- x86_64 (with NASM/GAS/flat assembler g)
  - GAS
  - NASM
  - flat assembler
- RISC-V 64
- WebAssembly (text format with WASI)

I would also like to use a
[literate programming](https://en.wikipedia.org/wiki/Literate_programming) tool document my code in
the future.

Assemblers/Runtimes used:
- [NASM](https://nasm.us/index.php)
- [QEMU](https://www.qemu.org/) (For RISC-V 64)
- [Wasmtime](https://wasmtime.dev/) (For WebAssembly text format with WASI)
- [Zig](https://ziglang.org/) (For a cross-platform LLVM assembler and build system)
- [flat assembler](https://flatassembler.net/docs.php?article=manual)

Debuggers:
- [LLDB](https://lldb.llvm.org/)
- [rr](https://rr-project.org/)


Worth reading:
- Syscalls:
  - https://github.com/ziglang/zig/blob/master/lib/std/os/linux/syscalls.zig *
  - https://man7.org/linux/man-pages/man2/syscall.2.html *

- RISC-V
  - https://github.com/riscv-non-isa/riscv-asm-manual *
  - https://github.com/riscv-non-isa/riscv-elf-psabi-doc *
  - https://riscv.org/technical/specifications/ *

- https://developer.ibm.com/articles/l-gas-nasm/ *
- https://lldb.llvm.org/use/tutorial.html *
- https://webassembly.org/specs/ *

\* I haven't fully read these yet.
