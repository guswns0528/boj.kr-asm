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

main:
    push rbp
    mov rbp, rsp
    sub rsp, 16

    lea rdi, [input]
    lea rsi, [rsp]
    lea rdx, [rsp + 4]
    mov rax, 0
    call scanf

    mov rax, [rsp]
    mov rbx, [rsp + 4]
    add rax, rbx

    lea rdi, [output]
    mov rsi, rax
    mov rax, 0
    call printf

    leave
    mov rax,0
    ret
