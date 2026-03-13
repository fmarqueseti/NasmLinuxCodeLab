%include 'bibliotecaF.inc'

SECTION .data
         arq   db 'musica.txt'
         tam   equ 2048

SECTION .bss
         fd    resb 4                     ; File descriptor
         buffer resb 2048

SECTION .text

global _start:

_start:
         mov   eax, OPEN_FILE
         mov   ebx, arq
         mov   ecx, OPEN_READ
         int   SYS_CALL
         mov   [fd], eax                  ; Saves file descriptor value

posicionar:
         mov   eax, SEEK_FILE
         mov   ebx, [fd]
         mov   ecx, 123                   ; Offset: shift 123 bytes
         mov   edx, SEEK_SET
         int   SYS_CALL

ler:
         mov   eax, READ_FILE
         mov   ebx, [fd]
         mov   ecx, buffer
         mov   edx, tam
         int   SYS_CALL
         
saidaNoConsole:
         mov   eax, SYS_WRITE
         mov   ebx, STD_OUT
         mov   ecx, buffer
         mov   edx, tam
         int   SYS_CALL

fechar:
         mov   eax, CLOSE_FILE
         mov   ebx, [fd]
         int   SYS_CALL
         
termino:
         mov   eax, SYS_EXIT
         mov   ebx, RET_EXIT
         int   SYS_CALL
