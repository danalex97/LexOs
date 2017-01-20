.global gdt_flush     
.extern gp      
      
gdt_flush:
    lgdt (gp)        
    mov $0x10, %ax      
    mov %ax, %ds
    mov %ax, %es
    mov %ax, %fs
    mov %ax, %gs
    mov %ax, %ss
    ret
		