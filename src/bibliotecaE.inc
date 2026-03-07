section .data
         LF         equ 0xA          ; Line Feed
         NULL       equ 0xD          ; Final da String
         SYS_EXIT   equ 0x1          ; Codigo de chamada para finalizar
         RET_EXIT   equ 0x0          ; Operacao com Sucesso
         STD_IN     equ 0x0          ; Entrada padrao
         STD_OUT    equ 0x1          ; Saida padrao
         SYS_READ   equ 0x3          ; Operacao de Leitura
         SYS_WRITE  equ 0x4          ; Operacao de Escrita
         SYS_CALL   equ 0x80         ; Envia informacao ao SO
         TAM_BUFFER equ 0xA

segment .bss
         BUFFER     resb TAM_BUFFER

segment .text

;---------------------------------------------------------------------;
; Calcular o tamanho da String                                        ;
;---------------------------------------------------------------------;
; Entrada: valor String em ECX                                        ;
; Saida: tamanho da String em EDX                                     ;
;---------------------------------------------------------------------;
tamStr:
         mov   edx, ecx

proxchar:
         cmp   byte[edx],NULL     ; Check for null terminator
         jz    terminei
         inc   edx
         jmp   proxchar

terminei:
         sub   edx, ecx
         ret

;---------------------------------------------------------------------;
; Saida do Resultado no Terminal                                      ;
;---------------------------------------------------------------------;
; Entrada: String em ECX                                              ;
; Saida: valor no terminal                                            ;
;---------------------------------------------------------------------;
mst_saida:
         call  tamStr
         mov   eax, SYS_WRITE
         mov   ebx, STD_OUT
         int   SYS_CALL
         ret

;---------------------------------------------------------------------;
; String para Inteiro                                                 ;
;---------------------------------------------------------------------;
; Entrada: String em ESI                                              ;
; Saida: Valor inteiro em EAX                                         ;
;---------------------------------------------------------------------;
str_to_int:
         xor   ebx, ebx            ; Zeroes ebx to store the result

         mov   ecx, esi
         call  tamStr              ; Number of digits to convert
         mov   ecx, edx

.prox_digito:
; 105 :: 0 x 10 + 1 = 1; 1 x 10 + 0 = 10; 10 x 10 + 5 = 105
         movzx eax, byte[esi]      ; Move with Zero-Extend
         inc   esi
         sub   al, '0'
         imul  ebx, 0xA
         add   ebx, eax
         loop  .prox_digito
         mov   eax, ebx            ; Move the result to eax
         ret

;---------------------------------------------------------------------;
; Inteiro para String                                                 ;
;---------------------------------------------------------------------;
; Entrada: Valor inteiro em EAX                                       ;
; Saida: String em ECX                                                ;
;---------------------------------------------------------------------;
int_to_str:
         lea   esi, [BUFFER]       ; Buffer where string will be stored

         add   esi, 0x9
         mov   byte[esi], NULL     ; Null at the end of the string
         mov   ebx, 0xA

.prox_digito:
; 107 :: LF; 7LF; 07LF; 107NULL
         xor   edx, edx            ; Zeroes edx to store the result
         div   ebx                 ; Divide ebx by edx
         add   dl, '0'             ; Convert the digit to its ASCII
         dec   esi
         mov   [esi], dl
         test  eax, eax            ; Check if eax is zero
         jnz   .prox_digito
         mov   ecx, BUFFER
         ret
