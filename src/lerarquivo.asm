%include 'bibliotecaF.inc'

SECTION .data
         n_arq db 'musica.txt'
         t_arq equ 2048

SECTION .bss
         fd    resb 4                     ; File descriptor
         buffer resb 2048

SECTION .text

global _start:

_start:
         mov   eax, OPEN_FILE
         mov   ebx, n_arq
         mov   ecx, OPEN_READ
         int   SYS_CALL
         mov   [fd], eax                  ; Saves file descriptor value

         mov   eax, READ_FILE
         mov   ebx, [fd]
         mov   ecx, buffer
         mov   edx, t_arq
         int   SYS_CALL         

         mov   eax, SYS_WRITE
         mov   ebx, STD_OUT
         mov   ecx, buffer
         mov   edx, t_arq
         int   SYS_CALL

         mov   eax, CLOSE_FILE
         mov   ebx, [fd]
         int   SYS_CALL

         mov   eax, SYS_EXIT
         mov   ebx, RET_EXIT
         int   SYS_CALL
