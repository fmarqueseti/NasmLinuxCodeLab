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
         call  string_to_int
         ret

mostrar_valor:
         call  int_to_string
         call  saidaResultado
         ret

string_to_int:
         xor ebx, ebx

.prox_digito:
         movzx eax, byte[esi]
         inc   esi
         sub   al, '0'
         imul  ebx, 0xA
         add   ebx, eax
         loop  .prox_digito
         mov   eax, ebx
         ret   

int_to_string:
         lea   esi, [BUFFER]
         add   esi, 0x9
         mov   byte[esi], 0xA
         mov   ebx, 0xA

.prox_digito:
         xor   edx, edx
         div   ebx
         add   dl, '0'
         dec   esi
         mov   [esi], dl
         test  eax, eax
         jnz   .prox_digito
         ret
