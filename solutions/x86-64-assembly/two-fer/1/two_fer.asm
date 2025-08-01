section .rodata
    start: db "One for ", 0
    end: db ", one for me.", 0
    you: db "you", 0

section .text
global two_fer
two_fer:
    push rdi
    lea rdi, [rel start]
    call add_string
    pop rdi
    cmp rdi, 0
    je add_you
    cmp BYTE [rdi], 0
    je add_you
    call add_string
    jmp add_end
add_you:
    lea rdi, [rel you]
    call add_string
add_end:
    lea rdi, [rel end]
    call add_string
    mov BYTE [rsi], 0
    ret

add_string:
    cmp BYTE [rdi], 0
    je add_string_ret
    mov cl, BYTE [rdi]
    mov BYTE [rsi], cl
    add rdi, 1
    add rsi, 1
    jmp add_string
add_string_ret:
    ret


%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
