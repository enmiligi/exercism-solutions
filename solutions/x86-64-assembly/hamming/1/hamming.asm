section .text
global distance
distance:
    mov rax, 0
distance_loop:
    mov bl, [rdi]
    mov cl, [rsi]
    cmp bl, 0
    je distance_ret
    cmp cl, 0
    je distance_ret
    inc rdi
    inc rsi
    cmp bl, cl
    je distance_loop
    inc rax
    jmp distance_loop
distance_ret:
    cmp bl, cl
    jne distance_different_length
    ret
distance_different_length:
    mov rax, -1
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
