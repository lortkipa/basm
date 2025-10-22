
.section .text
    
    # RDI - string, ESI - character count
    .global console_print
    console_print:
        movl %esi, %edx
        movq %rdi, %rsi
        movl $1, %eax
        movl %eax, %edi
        syscall

        ret
