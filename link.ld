OUTPUT_FORMAT(elf32-i386)
ENTRY(start)
SECTIONS
  {
      . = 0x100000;
      .header : { *(.multiboot_header) }
      .text : { *(.text) }
      .data : { *(.data) }
      .bss  : { *(.bss)  }
  }