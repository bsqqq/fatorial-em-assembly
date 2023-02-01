; por Vinicius Moura Aragão
; filedescriptor (0 = stdout, 1 = stdin, 2 = stderr)
; buffer = conteudo pra ser lido
; count = quantos bytes serão necessarios para alguma operação

section .data
	perg db "Numero: ", 10
    cr db 0, 10

section .bss
    entrada resb 8
    saida resb 8

section .text
	global _start

_start:

    call _printPergunta
    call _setNumero
    call _fatorial
    call _printResultado
    call _carriageReturn

    mov rax, 60
    mov rdi, 0
    syscall

_printPergunta:
    mov rax, 1
    mov rdi, 1
    mov rsi, perg
    mov rdx, 8
    syscall
    ret

_setNumero:
    mov rax, 0
    mov rdi, 0
    mov rsi, entrada
    mov rdx, 1
    syscall
    ret

_fatorial:
    mov rax, [entrada]
    sub rax, 30h
    mov rcx, rax
    dec rcx
    laco:
        mul rcx
    loop laco
    mov [saida], rax
    ret

_printResultado:
    mov rax, 1
    mov rdi, 1
    mov rsi, saida
    mov rdx, 9
    syscall
    ret

_carriageReturn:
    mov rax, 1
    mov rdi, 1
    mov rsi, cr
    mov rdx, 2
    syscall
    ret