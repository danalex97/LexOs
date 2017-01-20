#ifndef _GDT_H_
#define _GDT_H_

void create_descriptor(uint32_t base, uint32_t limit, uint16_t flag);
void register_all_gdt_entries(void);

#endif