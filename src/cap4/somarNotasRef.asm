%include 'bibliotecaF.inc'

section .data
         arq   db 'nota'            ; Input file name
         tam   equ 0x3
         fd    dq 0                 ; File descriptor
         msg   db 'Resultado: '
         t_msg equ $-msg
         r1    db ' - Aprovado', LF
         t_r1  equ $-r1
         r2    db ' - Reprovado', LF
         t_r2  equ $-r2
         frel  db 'relatorio', NULL ; Output file name
         fdr   dq 0                 ; Output file descriptor

section .bss
         val1  resw 2
         val2  resw 2
         soma  resb 10

section .text

global _start:

_start:
         mov   eax, OPEN_FILE
         mov   ebx, arq
         mov   ecx, OPEN_READ
         int   SYS_CALL
         mov   [fd], eax            ; Saves file descriptor value

criarArquivoRelatorio:
         mov   eax, CREATE_FILE
         mov   ebx, frel
         mov   ecx, 0o664           ; Perms: 6-owner, 6-group, 4-others
         mov   edx, 0x3
         int   SYS_CALL
         mov   [fdr], eax           ; Saves file descriptor value

lerLinha1:
         mov   byte[soma], 0x0

         mov   eax, READ_FILE
         mov   ebx, [fd]
         mov   ecx, val1
         mov   edx, tam
         int   SYS_CALL
         
         lea   esi, [val1]
         mov   ecx, 0x2
         call  string_to_int
         add   [soma], eax

         cmp   eax, 0x0
         je    fecharArquivo

lerLinha2:
         mov   eax, READ_FILE
         mov   ebx, [fd]
         mov   ecx, val2
         mov   edx, tam
         int   SYS_CALL

         lea   esi, [val2]
         mov   ecx, 0x2
         call  string_to_int
         add   [soma], eax

dividePor2:
         mov   edx, 0x0
         mov   eax, [soma]
         mov   ebx, 0x2
         div   ebx
         mov   [soma], eax

resultado:
         mov   eax, WRITE_FILE
         mov   ebx, [fdr]
         mov   ecx, msg
         mov   edx, t_msg
         int   SYS_CALL

         mov   eax, [soma]
         call  int_to_string
         mov   ecx, eax
         call  tamStr

         mov   eax, WRITE_FILE
         mov   ebx, [fdr]
         int   SYS_CALL        

         movzx eax, byte[soma]  ; Move with Zero-Extend
         cmp   eax, 0x5
         jb    resReprovado

resAprovado:
         mov   eax, WRITE_FILE
         mov   ebx, [fdr]
         mov   ecx, r1
         mov   edx, t_r1
         int   SYS_CALL
         
         jmp   lerLinha1

resReprovado:         
         mov   eax, WRITE_FILE
         mov   ebx, [fdr]
         mov   ecx, r2
         mov   edx, t_r2
         int   SYS_CALL

         jmp   lerLinha1

fecharArquivo:
         mov   eax, CLOSE_FILE
         mov   ebx, [fd]
         int   SYS_CALL

fecharArquivoRelatorio:
         mov   eax, CLOSE_FILE
         mov   ebx, [fdr]
         int   SYS_CALL

final:
         mov   eax, SYS_EXIT
         mov   ebx, RET_EXIT
         int   SYS_CALL
