LINUX_KERNEL_PATH = /sdk/kernel
CURRENT_PATH := $(shell pwd)
obj-m := dm542.o

kernel_modules:
	$(MAKE) -C $(LINUX_KERNEL_PATH) M=$(CURRENT_PATH) modules \
	ARCH=arm64 \
	CROSS_COMPILE=/sdk/prebuilts/gcc/linux-x86/aarch64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu-
	@find . -type f -not -name "*.ko" -and \( -name "*.o" -or -name "*.mod.c" -or -name "*.mod.o" -or -name "*.cmd" -or -name "Module.symvers" -or -name "modules.order" \) -delete

clean:
	$(MAKE) -C $(LINUX_KERNEL_PATH) M=$(CURRENT_PATH) clean