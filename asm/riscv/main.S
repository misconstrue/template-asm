.global main

#include "common.h"

.section .text
main:
    mv t0, t1
    mv t0, t1
    la t0, _data
    li t1, 8
    lb t1, 0(t0)
    sb t1, 0(t0)
    lb t1, 0(t0)
#为了测试spike0地址映射的问题
	li t0, SV_48_OFFSET
	sb t1, 0(t0)
	lb t1, 0(t0)
	cbo.inval 0(a5)
	cbo.flush 0(a5)
#	.int 0x0
#   .int 0xffffffff
    ret

.section .data
_data:
    .quad 0xffffffffffffffff
