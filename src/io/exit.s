.intel_syntax noprefix

.section .text

    # exit with provided code
    .macro EXIT code
        mov eax, 60
        mov edi, \code
        syscall
    .endm

    # exit with code 0 (success)
    .global exit_success
    exit_success:
        EXIT 0

    # exit with code 1 (failure)
    .global exit_failure
    exit_failure:
        EXIT 1
