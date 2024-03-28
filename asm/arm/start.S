.global start, UART_BASE_ADDR


.data 1
.long 0x11111111


#define A64_EL0_RV  0x1
#define A64_EL0_T	0x2


.text
start:
	mov x0, #0

#if EL_X==A64_EL0_RV
	orr x0, x0, 2
#elif EL_X==A64_EL0_T
	orr x0, x0, 1
#endif
	mov x1, x0
	adr x1, UART_BASE_ADDR
	ldr x0, =0x13000000
	str x0, [x1]
	mov x0, x1
#	bl main
	mov w0, 0x18
	ldr x1, =0x13000000
	strb w0, [x1]
	b .

.data
UART_BASE_ADDR:
.int 0xeeeeeeee
.int 0xeeeeeeee
.fill 32,4,0xcccccccc

.bss
.int 0x00000000
.int 0x00000000


.data
.long 0x22222222
