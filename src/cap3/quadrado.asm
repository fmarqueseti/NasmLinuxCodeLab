%include 'bibliotecaE.inc'
%include 'bibliotecaD.inc'
       
SECTION .bss
         lado  resb 0x1                         ; Valor do Lado Inicial

SECTION .text

global _start

_start:
         mov   byte[lado], 0x8                  ; Valor inicial do Lado
         mov   edi, dword[lado]                 ; Line count

inicio:
         mov   esi, dword[lado]                 ; Column count
         call  impLinha

         sub   edi, 0x1
         cmp   edi, 0x0
         je    saida
         jmp   inicio

impLinha:
         mov   edx, 0x1
         call  impEstrela
         sub   esi, 0x1
         cmp   esi, 0x1
         jg    impLinha
         mov   edx, 0x2
         call  impEstrela
         ret

saida:
         mov   eax, SYS_EXIT
         mov   ebx, RET_EXIT
         int   SYS_CALL