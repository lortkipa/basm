
.section .rodata

    # error messages
    no_args_msg: .ascii "no arguments provided.\n"
                 .ascii "basic usage: basm [INPUT_FILE] -o [OUTPUT_FILE]\n"
                 .ascii "for additional help: basm --help\n"

.section .text

    .global main
    main:
        # save stack frame
        movq %rsp, %rbp

        # align stack to 16 bytes
        subq $8, %rsp

        # if no arguments are provided, jump to error
        cmpb $1, (%rbp)
        je no_args_error

        # restore stack frame
        movq %rbp, %rsp

        # exit with success
        xorl %eax, %eax
        call exit

    no_args_error:
        # log error msg
        leaq no_args_msg(%rip), %rax
        movl $104, %ecx
        call print

        # restore stack frame
        movq %rbp, %rsp

        # exit with failure
        movl $1, %eax
        call exit
