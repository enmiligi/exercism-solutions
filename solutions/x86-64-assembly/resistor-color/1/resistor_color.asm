section .data
    black: db "black", 0
    brown: db "brown", 0
    red: db "red", 0
    orange: db "orange", 0
    yellow: db "yellow", 0
    green: db "green", 0
    blue: db "blue", 0
    violet: db "violet", 0
    grey: db "grey", 0
    white: db "white", 0
    colors_list: dq black, brown, red, orange, yellow, green, blue, violet, grey, white, 0

section .text
global color_code
color_code:
    mov r15, 0
    lea r14, [rel colors_list]
    mov r13, rdi
color_code_loop:
    mov rdi, r13
    mov rsi, [r14]
    call string_equal
    je color_code_ret
    add r14, 8
    inc r15
    jmp color_code_loop
color_code_ret:
    mov rax, r15
    ret

string_equal:
    mov al, [rdi]
    cmp al, [rsi]
    jne string_equal_ret
    jz string_equal_ret
    inc rdi
    inc rsi
    jmp string_equal
string_equal_ret:
    ret

global colors
colors:
    lea rax, [rel colors_list]
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
