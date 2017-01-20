#include <stdbool.h> 
#include <stddef.h>
#include <stdint.h>

#include "vga.h"
 
#if defined(__linux__)
	#error "Check for cross compiler"
#endif
 
#if !defined(__i386__)
	#error "Check for ix86-elf compiler"
#endif
 
void kernel_main(void) {
	/* Initialize terminal interface */
	terminal_initialize();
 
	/* Newline support is left as an exercise. */
	terminal_writestring("Hello, kernel World!\n");
}
