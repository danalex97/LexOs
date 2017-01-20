#ifndef _GDT_H_
#define _GDT_H_

extern void gdt_flush();
void gdt_set_gate(int num, unsigned long base, unsigned long limit,
                           unsigned char access, unsigned char gran);
void gdt_install();

#endif