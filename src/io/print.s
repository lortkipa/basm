
.intel_syntax noprefix

.section .rodata

    nl: .byte '\n'

.section .text

    # print string with length
    # rsi - string
    # edx - length
    .global print_len
    print_len:
        # call system for printing
        mov eax, 1
        mov edi, eax
        syscall

        ret

    # print string with length followed by new-line
    # rsi - string
    # edx - length
    .global println_len
    println_len:
        # print string
        call print_len

        # print new-line and return
        jmp print_nl

    # print null-terminated string
    # rsi - string
    .global print_nt
    print_nt:
        # get length of string
        call str_len

        # print string with length
        mov edx, eax
        call print_len

        ret

    # print null-terminated string followed by new-line
    # rsi - string
    .global println_nt
    println_nt:
        # print string
        call print_nt

        print_nl:
        # print new-line
        lea rsi, [rip + nl]
        mov edx, 1
        call print_len

        ret