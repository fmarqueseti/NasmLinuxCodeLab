%include 'bibliotecaF.inc'

SECTION .data
         msg   db 'Hello World! Voltamos ao Inicio...', LF
         t_msg equ $ - msg
         n_arq db 'hello', NULL     ; File name
         t_arq equ $ - n_arq
         fd    dq 0                 ; File descriptor

SECTION .text

global _start:

_start:
         mov   eax, CREATE_FILE
         mov   ebx, n_arq
         mov   ecx, 0o664           ; Perms: 6-owner, 6-group, 4-others
         mov   edx, t_arq
         int   SYS_CALL
         mov   [fd], eax            ; Saves file descriptor value

         mov   eax, WRITE_FILE
         mov   ebx, [fd]
         mov   ecx, msg
         mov   edx, t_msg
         int   SYS_CALL

         mov   eax, CLOSE_FILE
         mov   ebx, [fd]
         int   SYS_CALL

         mov   eax, SYS_EXIT
         mov   ebx, RET_EXIT
         int   SYS_CALL
