%include "bibliotecaE.inc"

section .data
         v1    db '105', NULL

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
         call  str_to_int
         ret

mostrar_valor:
         call  int_to_str
         call  mst_saida
         ret
