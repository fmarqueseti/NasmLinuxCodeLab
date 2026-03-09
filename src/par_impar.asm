%include 'bibliotecaE.inc'

section .data
         msg   db 'Entre com o valor de 3 digitos:', LF, NULL
         pMsg  db 'Numero Par!', LF, NULL
         iMsg  db 'Numero Impar!', LF, NULL

section .bss
         num   resb 1

section .text

global _start

_start:
         mov   ecx, msg             ; Message to ask for input
         call  mst_saida

entrada_valor:
         mov   eax, SYS_READ
         mov   ebx, STD_IN
         mov   ecx, num
         mov   edx, 0x4
         int   SYS_CALL
         mov   byte [num + 1], 0xD  ; Replace LF by NULL

         lea   esi, [num]
         call  str_to_int           ; Result in EAX

verificar:
         mov   edx, 0x0
         mov   ebx, 0x2
         div   ebx                  ; EAX = EAX ÷ EBX. Remainder in EDX
         cmp   edx, 0x0
         jz    mostra_par

mostra_impar:
         mov   ecx, iMsg            ; Message to say it's odd
         call  mst_saida
         jmp   saida

mostra_par:
         mov   ecx, pMsg            ; Message to say it's even
         call  mst_saida

saida:
         mov   eax, SYS_EXIT
         mov   ebx, RET_EXIT
         int   SYS_CALL
