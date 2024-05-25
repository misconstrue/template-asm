#include "header.h"
.global exit
_exit:
    ldr x0, =UART_BASE
    mov x1, #4
    strb w1, [x0]
    dsb sy
    isb
b _exit

#ifdef CACHE
.global enable_cache
enable_cache:

    ret
#endif

#ifdef PMU
.global enable_pmu
enable_pmu:

    ret
#endif