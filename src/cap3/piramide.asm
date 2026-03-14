%include 'bibliotecaE.inc'
%include 'bibliotecaD.inc'

SECTION .data
         TAM   equ 0x8                        ; Pyramid size

SECTION .bss
         alt   resb 0x4                       ; Altura (fixa)
         linha resb 0x4                       ; Linha atual
         q_esp resb 0x4                       ; Qtd de espacos
         q_str resb 0x4                       ; Qtd de estrelas
         q_lin resb 0x4                       ; Qtd linhas ja impressas

SECTION .text

global _start

_start:
         mov   byte[linha], 0x1
         mov   byte[q_str], 0x1
         mov   byte[alt], TAM
         mov   byte[q_lin], TAM

inicio:
         mov   edi, dword[alt]
         sub   edi, dword[linha]
         call  impEspacos

         mov   edi, dword[q_str]
         call  impEstrelas

         sub   byte[q_lin], 0x1
         cmp   byte[q_lin], 0x0
         je    saida
         add   byte[q_str], 0x2
         add   byte[linha], 0x1
         jmp   inicio

impEspacos:
         cmp   edi, 0x1
         jl    finalImpEspaco
         mov   edx, 0x1                       ; Only space char, no LF
         call  impEspaco
         sub   edi, 0x1
         jmp   impEspacos

finalImpEspaco:
         ret

impEstrelas:
         cmp   edi, 0x1
         je    finalImpEstrela
         mov   edx, 0x1                       ; Only star char, no LF
         call  impEstrela
         sub   edi, 0x1
         jmp   impEstrelas

finalImpEstrela:
         mov   edx, 0x2                       ; Star char, and LF
         call  impEstrela
         ret

saida:
         mov   eax, SYS_EXIT
         mov   ebx, RET_EXIT
         int   SYS_CALL
