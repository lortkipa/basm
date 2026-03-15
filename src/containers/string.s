.intel_syntax noprefix

.section .text

    # get length of null-terminated string
    # rsi (not changed) - string
    # ret eax - length
    .global str_len
    str_len:
        # init length counter
        mov eax, 0

        str_len.check_char:
            # return length if char is null-terminator
            cmp byte ptr [rsi + rax], 0
            je str_len.finish

            # char is not null-terminator, so move to next one
            inc eax
            jmp str_len.check_char

        str_len.finish:
    ret
