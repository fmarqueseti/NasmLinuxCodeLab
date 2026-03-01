%include "bibliotecaE.inc"

section .data
         v1    dw '105', 0xa

section .text

global _start

_start:
         call  converter_valor
         add   eax, 0x2            ; Increment the value by 2
         call  mostrar_valor
         mov   eax, SYS_EXIT
         mov   ebx, RET_EXIT
         int   SYS_CALL

converter_valor:
         lea   esi, [v1]           ; Load Effective Address
         mov   ecx, 0x3            ; Number of digits to convert
         call  str_to_int
         ret

mostrar_valor:
         call  int_to_str
         call  mst_saida
         ret
