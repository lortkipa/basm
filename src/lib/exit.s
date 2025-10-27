
.section .text
    
    # exit program with code (success or failure)
    # ARGUMENTS: INT32 exit code
    .global exit
    exit:
        # load exit code into correct register and call linux system call for exiting the program
        # see: https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/
        movl %eax, %edi
        movl $60, %eax
        syscall
