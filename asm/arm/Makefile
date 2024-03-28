target=demo.ELF

CFLAGS=-nostdlib
LDFLAGS=-Wl,--entry="start",--build-id=none,--verbose,-Tlink.lds
CC=/home/lijing/Desktop/work/software/arm-gcc/gcc-linaro-14.0.0-2023.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu
EL_X?=A64_EL_RV

S_srcs := $(wildcard ./*.S)
c_srcs := $(wildcard ./*.c)

build:$(target)

$(target) : $(S_srcs) $(c_srcs)
	$(CC)-gcc $(CFLAGS) $(LDFLAGS) -DEL_X=A64_EL0_T  $^ -o $@
	$(CC)-objdump -D $@ > $(target).asm
	$(CC)-objcopy -O binary $@  $(target).bin
	hexdump -x $(target).bin > $(target).hex

.PHONY: clean
clean:
	-rm *.ELF  *.asm  *.bin  *.hex
