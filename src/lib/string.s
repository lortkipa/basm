.section .text

    # calculate length of null-terminated string
    # ARGUMENTS: STRING string
    # RETURN: UINT32 length of string
    .global string_length
    string_length:
        # align stack to 16 bytes
        subq $8, %rsp

        # process single char and if null-terminator is reached, jump to return. else, go to next char and do same thing again
        # ROLES: ECX length counter
        xorl %ecx, %ecx
        string_length.char:
        cmpb $0, (%rax, %rcx)
        je string_length.return
        incl %ecx
        jmp string_length.char

        # put length into correct return register, restore stack and return
        # ROLES: ECX length
        string_length.return:
        movl %ecx, %eax
        addq $8, %rsp
        ret
