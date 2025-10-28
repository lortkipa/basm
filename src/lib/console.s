
.section .text
    
    # display message on console
    # ARGUMENTS: STRING msg, INT32 length
    .global print
    print:
        # align stack to 16 bytes
        subq $8, %rsp

        # load parameters into correct registers and call linux system call for writing on console
        # see: https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/
        movq %rax, %rsi
        movl %ecx, %edx
        movl $1, %edi
        movl %edi, %eax
        syscall

        # restore stack
        addq $8, %rsp

        ret
