section .text
global leap_year

is_divisible_by:
    mov rax, rdi
    mov rdx, 0
    div rsi
    cmp rdx, 0
    ret

leap_year:
    mov rsi, 400
    call is_divisible_by
    jz is_leap_year
    mov rsi, 100
    call is_divisible_by
    jz no_leap_year
    mov rsi, 4
    call is_divisible_by
    jz is_leap_year
no_leap_year:
    mov rax, 0
    ret
is_leap_year:
    mov rax, 1
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
