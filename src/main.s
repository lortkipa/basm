.intel_syntax noprefix

.section .rodata

    str: .string "Hello World!"
    .set str.len, $ - str

.section .text

    .global main
    main:
        lea rsi, [rip + str]
        mov edx, str.len
        call println_len

        jmp exit_success