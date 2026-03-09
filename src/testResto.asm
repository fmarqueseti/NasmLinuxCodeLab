%include 'bibliotecaE.inc'

section .bss
         num resb 1

section .text

global _start

_start:
         mov   edx, 0
         mov   eax, 58   
         mov   ebx, 2    
         div   ebx                 ; EAX = EAX / EBX. Remainder in EDX.

         mov   eax, edx
         call  int_to_str
         call  mst_saida

saida:
         mov   eax, SYS_EXIT
         int   SYS_CALL