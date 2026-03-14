%include 'bibliotecaE.inc'

section .data
         msg1: DB 'Parte 1', LF, NULL
         msg2: DB 'Parte 2', LF, NULL
         msg3: DB 'Parte 3', LF, NULL
         msg4: DB 'Parte 4', LF, NULL
         arr:  DD 10, 22, 13, 14, 55

section .text

global _start

_start:

entire_array:                    ; Print the entire array
         mov   eax, SYS_WRITE
         mov   ebx, STD_OUT
         mov   ecx, msg1
         mov   edx, 36
         int   SYS_CALL

partial_array:                   ; Print the partial array
         mov   eax, SYS_WRITE
         mov   ebx, STD_OUT
         mov   ecx, msg3
         mov   edx, 18
         int   SYS_CALL

doubleword:                      ; Print (14) the doubleword at index 3
         mov   eax, [arr + 4 * 3]
         call  int_to_str
         call  mst_saida

saida:
         mov   eax, SYS_EXIT
         mov   ebx, RET_EXIT
         int   SYS_CALL
