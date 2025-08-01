section .rodata
    start: db "One for "
    start_length: equ $-start
    end: db ", one for me.", 0
    end_length: equ $-end
    you: db "you"
    you_length: equ $-you

section .text
global two_fer
two_fer:
    cld
    push rdi
    mov rdi, rsi
    lea rsi, [rel start]
    mov rcx, start_length
    rep movsb
    pop rsi
    cmp rsi, 0
    je add_you
    cmp BYTE [rsi], 0
    je add_you
    call add_string
    jmp add_end
add_you:
    lea rsi, [rel you]
    mov rcx, you_length
    rep movsb
add_end:
    lea rsi, [rel end]
    mov rcx, end_length
    rep movsb
    ret

add_string:
    lodsb
    cmp al, 0
    je add_string_ret
    stosb
    jmp add_string
add_string_ret:
    ret


%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
