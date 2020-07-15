default rel
section .data
    input: db "%d %d",0
    output: db "%d",10,0

section .text
    global main
    extern scanf
    %define scanf scanf WRT ..plt
    extern printf
    %define printf printf WRT ..plt

get_quadrant:
    push rbp
    mov rbp, rsp

    cmp edi, 0
    jg x_gt
    cmp esi, 0
    jg x_lt_y_gt
    mov rax, 3
    jmp Lend
  x_lt_y_gt:
    mov rax, 2
    jmp Lend
  x_gt:
    cmp esi, 0
    jg x_gt_y_gt
    mov rax, 4
    jmp Lend
  x_gt_y_gt:
    mov rax, 1
  Lend:
    leave
    ret

main:
    push rbp
    mov rbp, rsp
    sub rsp, 16

    lea rdi, [input]
    lea rsi, [rsp]
    lea rdx, [rsp + 4]
    mov rax, 0
    call scanf

    mov edi, [rsp]
    mov esi, [rsp + 4]
    call get_quadrant

    lea rdi, [output]
    mov rsi, rax
    mov rax, 0
    call printf

    leave
    mov rax,0
    ret
