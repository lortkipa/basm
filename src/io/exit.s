
.section .text
    
    # RDI - exit code
    .global exit
    exit:
        movl $60, %eax
        syscall
