#ifndef _VGA_H_
#define _VGA_H_

void terminal_initialize(void);
void terminal_setcolor(uint8_t color);
void terminal_writestring(const char* data);

#endif