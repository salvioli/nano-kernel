.PHONY: clean all

all: kernel-007

kernel-007: kernel
	mv kernel kernel-007

kernel: kasm.o kc.o multiboot_header.o
	ld -m elf_i386 -T link.ld -o kernel multiboot_header.o kasm.o kc.o

kasm.o: kernel.asm
	nasm -f elf32 kernel.asm -o kasm.o

multiboot_header.o: multiboot_header.asm
	nasm -f elf32 multiboot_header.asm -o multiboot_header.o

kc.o: kernel.c
	gcc -m32 -c kernel.c -o kc.o

clean:
	rm -f *.o kernel kernel-007