    .section .text.entry
    .globl _start
_start:
    la sp, boot_stack_top # 栈保护
    call rust_main # rust启动!

    .section .bss.stack
    .globl boot_stack_lower_bound
boot_stack_lower_bound: # 低地址, 栈尾
    .space 4096 * 16 # 4K * 16, 64KB
    .globl boot_stack_top # 导出全局符号
boot_stack_top: # 高地址, 栈顶