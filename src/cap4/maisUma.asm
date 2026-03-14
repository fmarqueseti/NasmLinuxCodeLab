%include 'bibliotecaF.inc'

SECTION .data
         msg   db 'Aqui temos mais uma linha', LF
         t_msg equ $ - msg
         n_arq db 'hello', NULL     ; File name
         t_arq equ $ - n_arq
         fd    dq 0                 ; File descriptor

SECTION .text

global _start:

_start:
         mov   eax, OPEN_FILE
         mov   ebx, n_arq
         mov   ecx, OPEN_CREATE+OPEN_WRITE+OPEN_APPEND
         mov   edx, 0o664           ; Perms: 6-owner, 6-group, 4-others         
         int   SYS_CALL
         mov   [fd], eax            ; Saves file descriptor value

escreverNoArquivo:
         mov   eax, WRITE_FILE
         mov   ebx, [fd]
         mov   ecx, msg
         mov   edx, t_msg
         int   SYS_CALL

fecharArquivo:
         mov   eax, CLOSE_FILE
         mov   ebx, [fd]
         int   SYS_CALL
         
final:
         mov   eax, SYS_EXIT
         mov   ebx, RET_EXIT
         int   SYS_CALL
