.global __start
__start:


# init sp
ldr x0, =__stack_start
msr sp_el0, x0
msr sp_el1, x0
msr sp_el2, x0
msr spsel, #1
mov sp, x0

# init vector table
ldr x0, =aarch64_el1_entry
msr vbar_el1, x0
ldr x0, =aarch64_el2_entry
msr vbar_el1, x0
ldr x0, =aarch64_el3_entry
msr vbar_el3, x0

#ifdef MMU
bl enable_mmu
#endif

#ifdef CACHE
bl enable_cache
#endif

#ifdef PMU
/*
x0 pmu_event num
x1 pmu_cntr num
*/
bl enable_pmu
#endif

_switch_mode:
#include "header.h"
ldr x0, =EL0_T
mrs x0, spsr_el3
bfi x0, x0, 0, 5
msr spsr_el3, x0
adr x0, _test_code
msr elr_el3, x0
_test_code:
	b .

_end:
	bl exit
	b _end




