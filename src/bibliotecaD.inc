section .data
         star  db '*', LF
         space db ' ', LF

segment .text

;---------------------------------------------------------------------;
; Imprimir um espaco em branco no terminal                            ;
;---------------------------------------------------------------------;
; Entrada: nenhuma                                                    ;
; Saida: espaco em branco impresso no terminal                        ;
;---------------------------------------------------------------------;
impEspaco:
         mov   eax, SYS_WRITE
         mov   ebx, STD_OUT
         mov   ecx, space
         int   SYS_CALL
         ret

;---------------------------------------------------------------------;
; Imprimir uma estrela (asterisco) no terminal                        ;
;---------------------------------------------------------------------;
; Entrada: nenhuma                                                    ;
; Saida: asterisco impresso no terminal                               ;
;---------------------------------------------------------------------;
impEstrela:
         mov   eax, SYS_WRITE
         mov   ebx, STD_OUT
         mov   ecx, star
         int   SYS_CALL
         ret
