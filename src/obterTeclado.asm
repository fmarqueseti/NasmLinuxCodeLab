%include 'bibliotecaF.inc'

section .data
         msg   db 'Entre com o valor da Nota ', \
                  '(formato 00 a 10 ou 20 para terminar):', \
                  LF, NULL
         t_msg equ $ - msg
         msg2  db 'Nota Gravadas!', LF, NULL
         t_msg2 equ $ - msg2
         arq   db 'notas', 0x0      ; File name
         fd    dq 0                 ; File descriptor

section .bss
         inpt  resb 2

section .text

global _start

_start:
         mov   eax, OPEN_FILE
         mov   ebx, arq
         mov   ecx, OPEN_CREATE+OPEN_WRITE+OPEN_APPEND
         mov   edx, 0o664           ; Perms: 6-owner, 6-group, 4-others
         int   SYS_CALL
         mov   [fd], eax            ; Saves file descriptor value

mostrarMsg:
         mov   eax, SYS_WRITE
         mov   ebx, STD_OUT
         mov   ecx, msg
         mov   edx, t_msg
         int   SYS_CALL

obterNota:
         mov   eax, SYS_READ
         mov   ebx, STD_IN
         mov   ecx, inpt
         mov   edx, 0x3
         int   SYS_CALL

verificar20:
         mov   ah, [inpt]
         sub   ah, '0'
         cmp   ah, 2
         je    fecharArquivo

escreverNoArquivo:
         mov   eax, WRITE_FILE
         mov   ebx, [fd]
         mov   ecx, inpt
         mov   edx, 0x3
         int   SYS_CALL
         jmp   mostrarMsg

fecharArquivo:
         mov   eax, CLOSE_FILE
         mov   ebx, [fd]
         int   SYS_CALL

mostrarMsgFinal:
         mov   eax, SYS_WRITE
         mov   ebx, STD_OUT
         mov   ecx, msg2
         mov   edx, t_msg2
         int   SYS_CALL

final:
         mov   eax, SYS_EXIT
         mov   ebx, RET_EXIT
         int   SYS_CALL
