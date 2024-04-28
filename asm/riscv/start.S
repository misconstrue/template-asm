.global start

#include "common.h"

.section .text
start:
// init PMP
	li t0, 0xFFFFFFFFF
	csrw pmpaddr0, t0
	li t0, 0x1f
	csrw pmpcfg0, t0
	sfence.vma
	fence.i

// enable delegate
	li t0, 0xc00
	csrs medeleg, t0

// init vector table
	li t1, SV_48_OFFSET
	la t0, M_vector_table
	add t0, t0, t1
	csrw mtvec, t0
	la t0, HS_vector_table
	add t0, t0, t1
	csrw stvec, t0
	la t0, VS_vector_table
	add t0, t0, t1
	csrw vstvec, t0
	fence.i

//	Enable MMU
	jal enable_mmu_s1
	jal enable_mmu_s2

//  Enable zicboz
	li t0, 0x10
	csrs menvcfg, t0

//  Enable float
	li t0, 0x6000
	csrs mstatus, t0
	csrs sstatus, t0
	csrs vsstatus, t0

//	Switch MODE
/*	MODE	mpv		mpp */
//	U		0		0
//	HS		0		1
//	M		0		3
//	VU		1		0
//	VS		1		1
#define U_MODE (0<<11)
#define HS_MODE (1<<11)
#define M_MODE (3<11)
#define VU_MODE (0<<11)|(1<<MSTATUS_MPV_SHIFT)
#define VS_MODE (1<<11)|(1<<MSTATUS_MPV_SHIFT)

switch_mode:
	li t0, VS_MODE
	csrr t1, mstatus
	or t1, t1, t0
	csrw mstatus, t1
	la t0, main
	li t1, SV_48_OFFSET
	or t0, t0, t1
	csrw mepc, t0
	la ra, _end
	or ra, ra, t1
	sfence.vma
	fence.i
	csrr t0, misa
	mret

_end:
	la t0, exit
	li t1, SV_48_OFFSET
	or t0, t0, t1
	jalr t0
	j _end
