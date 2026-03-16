; Library for file operation 64bits registers

section .data
         LF          equ 10          ; Line Feed
         NULL        equ 0           ; Final da String
         SYS_EXIT    equ 60          ; Codigo de chamada para finalizar
         EXIT_SUCESS equ 0           ; Operacao com Sucesso (RET_EXIT) 

         STDIN       equ 0           ; System.in
         STDOUT      equ 1           ; System.out
         STDERR      equ 2           ; System.err

         SYS_READ    equ 0           ; read
         SYS_WRITE   equ 1           ; print

         OPEN_READ   equ 0           ; abrir arquivo em modo leitura

         READ_FILE   equ 0           ; leitura do arquivo
         OPEN_FILE   equ 2           ; abrir arquivo
         CLOSE_FILE  equ 3           ; fechar arquivo

section .text

;---------------------------------------------------------------------;
; Calcular o tamanho da String                                        ;
;---------------------------------------------------------------------;
; Entrada: valor String em RDI                                        ;
; Saida: tamanho da String em rdx                                     ;
;---------------------------------------------------------------------;
_ctCaracteres:
         mov   rbx, rdi
         mov   rdx, 0

fazLoop:
         cmp   byte[rbx], NULL
         je    termina
         inc   rdx
         inc   rbx
         jmp   fazLoop

termina:
         ret

;---------------------------------------------------------------------;
; Saida (impressão) no Terminal                                       ;
;---------------------------------------------------------------------;
; Entrada: String em RDI                                              ;
; Saida: valor no terminal                                            ;
;---------------------------------------------------------------------;
_imprimir:
         call  _ctCaracteres
         mov   rax, SYS_WRITE
         mov   rsi, rdi
         mov   rdi, STDOUT
         syscall
         ret
