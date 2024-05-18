OUTPUT_ARCH(riscv)
ENTRY(_start)
BASE_ADDRESS = 0x80200000;

SECTIONS
{
    . = BASE_ADDRESS;
    /* 内核起始地址 */
    skernel = .;

    /* text段起始地址 */
    stext = .;
    .text : {
        *(.text.entry)
        *(.text .text.*)
    }
    . = ALIGN(4K);
    /* text段结束地址 */
    etext = .;

    /* rodata段起始地址 */
    srodata = .;
    .rodata : {
        *(.rodata .rodata.*)
        *(.srodata .srodata.*)
    }
    . = ALIGN(4K);
    /* rodata段结束地址 */
    erodata = .;

    /* data段起始地址 */
    sdata = .;
    .data : {
        *(.data .data.*)
        *(.sdata .sdata.*)
    }
    . = ALIGN(4K);
    /* data段结束地址 */
    edata = .;

    /* 一般存放需要被初始化为0的数据 */
    .bss : {
        /* 自定义的栈帧最终会被收集到这里, 需要被初始化为0 */
        *(.bss.stack)
        /* 除了.bss.stack外的堆栈起始地址 */
        sbss = .;
        *(.bss .bss.*)
        *(.sbss .sbss.*)
    }
    . = ALIGN(4K);
    /* 除了.bss.stack外的堆栈结束地址 */
    ebss = .;

    /* 内核结束地址 */
    ekernel = .;

    /* 特殊的段名, 用于丢弃匹配的段 */
    /DISCARD/ : {
        /* eh_frame通常包含异常处理和堆栈展开的信息 */
        *(.eh_frame)
    }
}