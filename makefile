all:	 BootLoad Kernelx86 Disk.img

BootLoad:
	@echo
	@echo ================ Build Boot Loader ================
	@echo
	make -C BootLoader
	@echo
	@echo ================ Build Complete ================
	@echo

Kernelx86:
	@echo
	@echo ================ Build 32bit Kernel ================
	@echo
	make -C Kernel32
	@echo
	@echo ================ Build Complete ================
	@echo

Disk.img: BootLoader	 Kernelx86
	@echo
	@echo ================ Disk Image Build Start ================
	@echo
	cat BootLoader/BootLoader.bin Kernel32/VirtualOS.bin > Disk.img
	@echo     
	@echo ================ All Build Complete ================
	@echo

clean:
	make -C BootLoader clean
	make -C Kernel32 clean
	rm -f Disk.img