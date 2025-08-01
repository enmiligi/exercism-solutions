section .text
global square_root
square_root:
    mov rbx, rdi
    mov rcx, 1
    sqrt_loop:
        add rbx, rcx ; result in rbx
        shr rbx, 1 ; rightshift is div by 2 (mean of rbx, rcx the sides of herons square)

        mov rax, rdi ; prepare division (which uses rax, rdx)
        mov rdx, 0  ; rdx are the first 64bit of a (rdx,rax) 128bit number   
        div rbx ; result in rax (remainder in rdx)
        mov rcx, rax

        sub rax, rbx
        cmp rax, 1 ; This prevents getting stuck in an infinite loop when no exact root
        jg sqrt_loop
        cmp rax, -1
        jl sqrt_loop
    
    cmovl rbx, rcx ; if (rcx < rbx) => rbx = rcx
    mov rax, rbx
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
