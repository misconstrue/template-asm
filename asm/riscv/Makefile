target?=demo.ELF
gcc-prefix=/home/lijing/Desktop/work/software/riscv-gcc/bin/riscv64-unknown-elf
CFLAGS:= -march=rv64gc_zba_zbb_zbs_zfh_zicsr_zicbom
LFLAGS:=-nostartfiles -nostdlib -nostartfiles

srcs=$(wildcard *.S)
objs=$(patsubst %.S, %.o, $(srcs))

.PHONY: build clean

run: build
	bash /home/lijing/Desktop/work/software/spike_install/spike.sh $(target)

build:$(target)
	@echo "Target ELF Path:" `readlink -f $(target)`

$(target):$(objs)
	$(gcc-prefix)-gcc $(LFLAGS) -Tlink.lds -e start $^ -o $@
	$(gcc-prefix)-objdump -D $@ > $(target).asm

%.o:%.S
	$(gcc-prefix)-gcc $(CFLAGS) -c $^ -o $@

clean:
	- rm *.o *.ELF *.asm
