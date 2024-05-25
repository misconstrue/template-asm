ENTRY(__start)
SECTIONS 
{
	. = 0x80000000;
	.text : {
	     *start.S(*)
	}

	.data : {
	     *(.data)
	}

	.bss : {
	     *(.bss)
	}

	. += 0x800;
	. = ALIGN(16);
	__stack_start = .;

}
