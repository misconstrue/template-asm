#include "common.h"

.altmacro
.macro vector_table_macro MODE, EPC_REG, SCRATCH_REG, RET_INST
.global \MODE&_vector_table
\MODE&_vector_table:
    csrw \SCRATCH_REG&, ra
.irp idx, t0,t1,t2,t3,t4,t5,t6
    la ra,reg_data
    sd \idx, 0(ra)
    addi ra, ra, 4
.endr  
    csrr t0, \EPC_REG&
    li t1, SV_48_OFFSET
    xor t0, t0, t1
    lw t0, 0(t0)
    li t1, 3
    and t0, t0, t1
    beq t0, t1, \MODE&_add_4bytes
\MODE&_add_2bytes:
    li t1, 2
    csrr t0, \EPC_REG&
    add t0, t0, t1
    j \MODE&_write_epc
\MODE&_add_4bytes:
    csrr t0, \EPC_REG&
    li t1, 4
    add t0, t0, t1
\MODE&_write_epc:
    csrw \EPC_REG&, t0
.irp idx, t0,t1,t2,t3,t4,t5,t6
    la ra,reg_data
    ld \idx, 0(ra)
    addi ra, ra, 4
.endr 
    csrr ra, \SCRATCH_REG&
    \RET_INST&
.endm

.section .text
.align 11
vector_table_macro M, mepc, sscratch, mret
.align 11
vector_table_macro HS, sepc, sscratch, sret
.align 11
vector_table_macro VS, sepc, sscratch, sret

.section .data
reg_data:
.rept 32
    .quad 0xffffffffffffffff
.endr