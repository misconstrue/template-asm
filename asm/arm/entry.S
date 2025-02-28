.macro def_entry_func label, el
\el\()_\label:
    mrs x0, elr_\el
    add x0, x0, #4
    msr elr_\el, x0
    b \el\()_\label
.endm

.align 12
.global aarch64_el1_entry
aarch64_el1_entry:
def_entry_func Synchronous_Current_El_Sp0, el1
def_entry_func IRQ_Current_El_Sp0, el1
def_entry_func FIQ_Current_El_Sp0, el1
def_entry_func SError_Current_El_Sp0, el1
def_entry_func Synchronous_Current_El_Spx, el1
def_entry_func IRQ_Current_El_Spx, el1
def_entry_func FIQ_Current_El_Spx, el1
def_entry_func SError_Current_El_Spx, el1
def_entry_func Synchronous_Lower_El_a64, el1
def_entry_func IRQ_Lower_El_a64, el1
def_entry_func FIQ_Lower_El_a64, el1
def_entry_func SError_Lower_El_a64, el1
def_entry_func Synchronous_Lower_El_A32, el1
def_entry_func IRQ_Lower_El_A32, el1
def_entry_func FIQ_Lower_El_A32, el1
def_entry_func SError_Lower_El_A32, el1

.global aarch64_el2_entry
aarch64_el2_entry:
def_entry_func Synchronous_Current_El_Sp0, el2
def_entry_func IRQ_Current_El_Sp0, el2
def_entry_func FIQ_Current_El_Sp0, el2
def_entry_func SError_Current_El_Sp0, el2
def_entry_func Synchronous_Current_El_Spx, el2
def_entry_func IRQ_Current_El_Spx, el2
def_entry_func FIQ_Current_El_Spx, el2
def_entry_func SError_Current_El_Spx, el2
def_entry_func Synchronous_Lower_El_a64, el2
def_entry_func IRQ_Lower_El_a64, el2
def_entry_func FIQ_Lower_El_a64, el2
def_entry_func SError_Lower_El_a64, el2
def_entry_func Synchronous_Lower_El_A32, el2
def_entry_func IRQ_Lower_El_A32, el2
def_entry_func FIQ_Lower_El_A32, el2
def_entry_func SError_Lower_El_A32, el2


.global aarch64_el3_entry
aarch64_el3_entry:
def_entry_func Synchronous_Current_El_Sp0, el3
def_entry_func IRQ_Current_El_Sp0, el3
def_entry_func FIQ_Current_El_Sp0, el3
def_entry_func SError_Current_El_Sp0, el3
def_entry_func Synchronous_Current_El_Spx, el3
def_entry_func IRQ_Current_El_Spx, el3
def_entry_func FIQ_Current_El_Spx, el3
def_entry_func SError_Current_El_Spx, el3
def_entry_func Synchronous_Lower_El_a64, el3
def_entry_func IRQ_Lower_El_a64, el3
def_entry_func FIQ_Lower_El_a64, el3
def_entry_func SError_Lower_El_a64, el3
def_entry_func Synchronous_Lower_El_A32, el3
def_entry_func IRQ_Lower_El_A32, el3
def_entry_func FIQ_Lower_El_A32, el3
def_entry_func SError_Lower_El_A32, el3
