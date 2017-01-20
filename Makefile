EXE := myos.bin
AS := i686-elf-as 
GCC := i686-elf-gcc -std=gnu99 -ffreestanding -O2 -Wall -Wextra

LDSCRIPT := linker.ld
LD := i686-elf-gcc -T $(LDSCRIPT) -ffreestanding -O2 -nostdlib 

OBJECTS_AS += boot.o
OBJECTS_GCC += kernel.o

all: $(EXE)

%.o: %.s
	$(AS) $< -o $@

%.o: %.c
	$(GCC) -c $< -o $@

$(EXE): $(OBJECTS_AS) $(OBJECTS_GCC)
	$(LD) $^ -lgcc -o $@

clean:
	rm $(EXE)
	rm -f *.o
	rm -r isodir

run:
	grub-file --is-x86-multiboot myos.bin
	mkdir -p isodir/boot/grub
	cp myos.bin isodir/boot/myos.bin
	cp grub.cfg isodir/boot/grub/grub.cfg
	grub-mkrescue -o myos.iso isodir
	qemu-system-i386 -cdrom myos.iso