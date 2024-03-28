OUTPUT_FORMAT("elf64-littleriscv", "elf64-littleriscv",
              "elf64-littleriscv")
OUTPUT_ARCH(riscv:rv64)
ENTRY(__start)

SECTIONS
{
    . = 0x80000000;
    __start_address = .;
    .boot :
    {
        _boot_start = .;
        start.o mm.o common.o (.text)
        _boot_end = .;
    }

    .text :
    {
        *(EXCLUDE_FILE(start.o) .text)
    }

    .data :
    {
        _data_start = .;
        *(.data)
        _data_end = .;
    }

    .bss :
    {
        _bss_start = .;
        *(.bss)
        _bss_end = .;
    }
    
    . = . + 0x800;
    .stack :
    {
        _stack_start = .;
        . = ALIGN(16);
        _stack_end = .;
    }
}
