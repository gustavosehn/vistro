ASM = nasm
CC = i686-elf-gcc
LD = i686-elf-ld

ASMFLAGS = -f elf32
CFLAGS = -ffreestanding -fno-stack-protector -nostdlib -nodefaultlibs
LDFLAGS = -T linker.ld

all: ./build/kernel.bin

./build/boot.o: boot.asm
	if not exist build mkdir build
	$(ASM) $(ASMFLAGS) boot.asm -o ./build/boot.o

./build/kernel.o: kernel.c
	if not exist build mkdir build
	$(CC) $(CFLAGS) -c kernel.c -o ./build/kernel.o

./build/kernel.bin: ./build/boot.o ./build/kernel.o
	$(LD) $(LDFLAGS) -o ./build/kernel.bin ./build/boot.o ./build/kernel.o

run: ./build/kernel.bin
	qemu-system-i386 -kernel ./build/kernel.bin

clean:
	if exist build rmdir /s /q build
