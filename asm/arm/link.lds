OUTPUT_FORMAT("elf64-littleaarch64","elf64-littleaarch64","elf64-littleaarch64")
ENTRY(__start)
SECTIONS 
{
	. = 0x80000000;
	.startup : {
		 *start.o(.text)
	}
	. = ALIGN(8);
	.text : {
		*.o(.text)
	}
	.data : {
		*.o(.data)
	}
	.bss : {
		*.o(.bss)
	}
	. += 0x8000;
	. = ALIGN(16);
	__stack_start = .;

}
