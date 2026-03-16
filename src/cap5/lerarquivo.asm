%include 'bibliotecaE.inc'

section .data
         n_arq db 'arquivo.txt', NULL
         t_arq equ 1024                   ; 1 Kb Leitura

section .bss
         fd    resb 4                     ;  File descriptor         
         buffer resb 4096

section .text

global _start

_start:
         mov   rax, OPEN_FILE
         mov   rdi, n_arq
         mov   rsi, OPEN_READ
         syscall
         mov   [fd], rax                  ; Saves file descriptor value

         mov   rax, READ_FILE;
         mov   rdi, [fd]
         mov   rsi, buffer
         mov   rdx, t_arq
         syscall

         mov   rax, SYS_WRITE
         mov   rdi, STDOUT
         mov   rsi, buffer
         mov   rdx, t_arq
         syscall

         mov rax, CLOSE_FILE
         mov rdi, [fd]
         syscall

         mov rax, SYS_EXIT
         xor rdi, rdi            ; Zerar
         syscall
