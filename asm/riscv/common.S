.global exit, puts
.section .text

#include "common.h"

exit:
    la a0, pass_str
    jal puts
    li t0, 4
    li t1, UART_BASE
    li t2, SV_48_OFFSET
    or t1, t1, t2
    sb t0, 0(t1)
    j exit

puts:
    li t0, UART_BASE
    li t2, SV_48_OFFSET
    or t0, t0, t2
1:
    lbu t1, (a0)
    beqz t1, 3f
2:
    sb t1, (t0)
    addi a0, a0, 1
    j   1b
3:
    ret

.section .data
pass_str:
.string "Test Pass Ok\n"