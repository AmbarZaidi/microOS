all: os-image
	qemu-system-i386 os-image 
	make clean

os-image: boot_sect.bin kernel.bin
	cat boot_sect.bin kernel.bin > os-image
	
kernel.bin: kernel/kernel.c kernel/kernel_entry.asm
	nasm kernel/kernel_entry.asm -f elf64 -o entry.o
	gcc -ffreestanding -c kernel/kernel.c -o kernel.o -std=c99
	ld -o kernel.bin -Ttext 0x1000 entry.o kernel.o --oformat binary

boot_sect.bin: bootloader/boot.asm
	nasm bootloader/boot.asm -o boot_sect.bin

clean:
	rm *.bin *.o os-image
