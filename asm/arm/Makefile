target=demo.ELF
CC=aarch64-linux-gnu

CFLAGS=-nostdlib -march=armv8.5-a
LDFLAGS=-Wl,-Tlink.lds

ifeq (MMU,1)
CFLAGS+=-DMMU
endif

ifeq (CACHE,1)
CFLAGS+=-DCACHE
endif

ifeq (PMU,1)
CFLAGS+=-DPMU
endif


asm_srcs := $(wildcard ./*.S)
c_srcs := $(wildcard ./*.c)
objs := $(patsubst %.S, %.o, $(asm_srcs))
objs += $(patsubst %.c, %.o, $(c_srcs))

build:$(target)
	@echo "gen $(target) finished"

$(target) : $(objs)
	$(CC)-gcc $(LDFLAGS) $^ -o $@
	echo "gen asm bin hex"
	@$(CC)-objdump -D $@ > $(target).asm
	@$(CC)-objcopy -O binary $@  $(target).bin
	@hexdump -x $(target).bin > $(target).hex

%.o : %.S
	$(CC)-gcc $(CFLAGS) -c $^ -o $@

%.o : %.c
	$(CC)-gcc $(CFLAGS) -c $^ -o $@

.PHONY: clean
clean:
	-@rm -rf *.o *.ELF  *.asm  *.bin  *.hex
