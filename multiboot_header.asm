; Offset	Type	Field Name	    Note 
; 0	        u32	    magic	        required 
; 4	        u32	    flags	        required 
; 8	        u32	    checksum	    required 
; 12	    u32	    header_addr	    if flags[16] is set 
; 16	    u32	    load_addr	    if flags[16] is set 
; 20	    u32	    load_end_addr	if flags[16] is set 
; 24	    u32	    bss_end_addr	if flags[16] is set 
; 28	    u32	    entry_addr	    if flags[16] is set 
; 32	    u32	    mode_type	    if flags[2] is set 
; 36	    u32	    width	        if flags[2] is set 
; 40	    u32	    height	        if flags[2] is set 
; 44	    u32	    depth	        if flags[2] is set 

section .multiboot_header
    ; multiboot spec
    align 4
    dd 0x1BADB002                   ; magic number
    dd 0x00                         ; flags
    dd - (0x1BADB002 + 0x00)        ; checksum sum of all 3 should be 0
    