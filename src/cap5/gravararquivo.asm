%include 'bibliotecaE.inc'

section .data
         n_arq db 'arquivo.txt', 0x0
         msg   db 'Hello World 2!', 0xA
         t_msg equ $-msg
         mse   db 'Erro ao abrir o arquivo!', 0x0
         t_mse equ $-mse

section .text

global _start

_start:
         ; Abrir o arquivo
         mov   rax, OPEN_FILE
         mov   rdi, n_arq
         mov   rsi, O_RDWR | O_CREATE | O_TRUNC
         mov   rdx, 0o664           ; Perms: 6-owner, 6-group, 4-others
         syscall

         cmp rax, 0x0               ; Update processor flags (RFLAGS)
         jl erroExiste              ; SF≠OF => rax < 0  (signed)

continuar:
         mov   rdi, rax
         mov   rax, SYS_WRITE
         mov   rsi, msg
         mov   rdx, t_msg
         syscall

         mov   rax, CLOSE_FILE
         mov   rdi, [rsp]
         syscall
         jmp   finalizar

erroExiste:
         mov   rax, OPEN_FILE
         mov   rdi, n_arq
         mov   rsi, O_RDWR | O_APPEND | O_TRUNC
         mov   rdx, 0o664           ; Perms: 6-owner, 6-group, 4-others
         syscall

         cmp rax, 0x0               ; Update processor flags (RFLAGS)
         jl erro                    ; SF≠OF => rax < 0  (signed)
         jmp continuar

erro:
         mov   rax, SYS_WRITE
         mov   rdi, STDOUT
         mov   rsi, mse
         mov   rdx, t_mse
         syscall

finalizar:
         mov   rax, SYS_EXIT
         mov   rdi, EXIT_SUCESS
         syscall