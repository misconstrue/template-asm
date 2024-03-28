.global enable_mmu_s1, enable_mmu_s2
.section .text

// MODE
#define SV_BARE 0x0
#define SV_39 0x8
#define SV_48 0x9
#define SV_57 0xa

// Page Entry Descriptor
#define PAGE_SHIFT 12
#define MODE_SHIFT 60
#define D_BIT 0x80
#define A_BIT 0x40
#define G_BIT 0x20
#define U_BIT 0x10
#define X_BIT 0x8
#define W_BIT 0x4
#define R_BIT 0x2
#define V_BIT 0x1

enable_mmu_s1:
	li t0, PAGE_SHIFT
	la t1, s1_page_table_entry
	srl t1, t1, t0
	li t0, (SV_48 << MODE_SHIFT)
	or t1, t1, t0
	csrw satp, t1
	csrw vsatp, t1
	sfence.vma
	fence.i
	ret

enable_mmu_s2:
	li t0, PAGE_SHIFT
	la t1, s2_page_table_entry
	srl t1, t1, t0
	li t0, (SV_48 << MODE_SHIFT)
	or t1, t1, t0
	csrw hgatp, t1
	sfence.vma
	fence.i
	ret

.align 12
.section .data
// low address
s1_page_table_entry:
	.quad 0x00000000000000df
	.quad 0x00000000100000df
	.quad 0x00000000200000df
	.quad 0x00000000300000df
.fill 252, 8, 0
// high address
	.quad 0x00000000000000cf
	.quad 0x00000000100000cf
	.quad 0x00000000200000cf
	.quad 0x00000000300000cf

.align 12
s2_page_table_entry:
	.quad 0x00000000000000df
	.quad 0x00000000100000df
	.quad 0x00000000200000df
	.quad 0x00000000300000df
