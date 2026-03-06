%include 'bibliotecaE.inc'

section .data
         tit   db LF,'+-------------+',LF,'| Calculadora |', \
                  LF,'+-------------+',NULL
         obV1  db LF,'Valor 1: ', NULL
         obV2  db LF,'Valor 2: ', NULL
         opc1  db LF,'1. Adicionar', NULL
         opc2  db LF,'2. Subtrair', NULL
         opc3  db LF,'3. Multiplicar', NULL
         opc4  db LF,'4. Dividir', NULL
         msgOp db LF,'Deseja Realizar? ', NULL
         msgEr db LF,'Valor da Opcao Invalido', NULL
         p1    db LF,'Processo Adicionar', NULL
         p2    db LF,'Processo Subtrair', NULL
         p3    db LF,'Processo Multiplicar', NULL
         p4    db LF,'Processo Dividir', NULL
         msgFm db LF,'Terminei.', LF, NULL
         msgR  db LF,'Resultado: ', NULL      

section .bss
         opc   resb 8
         num1  resb 8
         num2  resb 8
         res   resb 4

section .text

global _start

_start:
         mov   ecx, tit
         call  mst_saida
         mov   ecx, opc1               ; 1. Adicionar
         call  mst_saida
         mov   ecx, opc2               ; 2. Subtrair
         call  mst_saida
         mov   ecx, opc3               ; 3. Multiplicar
         call  mst_saida
         mov   ecx, opc4               ; 4. Dividir
         call  mst_saida

         mov   ecx, msgOp              ; Deseja Realizar?
         call  mst_saida
         mov   eax, SYS_READ
         mov   ebx, STD_IN
         mov   ecx, opc
         mov   edx, 0x2
         int   SYS_CALL

         mov   ah, [opc]
         sub   ah, '0'                 ; See ASC code table

         cmp   ah, 4
         jg    msterro
         cmp   ah, 1
         jl    msterro

         mov   ecx, obV1               ; Valor 1:
         call  mst_saida
         mov   eax, SYS_READ
         mov   ebx, STD_IN
         mov   ecx, num1
         mov   edx, 0x3
         int   SYS_CALL
         mov   byte [num1 + 1], 0xD    ; Replace LF by NULL

         mov   ecx, obV2               ; Valor 2:
         call  mst_saida
         mov   eax, SYS_READ
         mov   ebx, STD_IN
         mov   ecx, num2
         mov   edx, 0x3
         int   SYS_CALL
         mov   byte [num2 + 1], 0xD    ; Replace LF by NULL

         mov   ah, [opc]
         sub   ah, '0'
         cmp   ah, 1
         je    adicionar
         cmp   ah, 2
         je    subtrair
         cmp   ah, 3
         je    multiplicar
         cmp   ah, 4
         je    dividir

saida:
         mov   ecx, msgFm
         call  mst_saida                ; Terminei.
         mov   eax, SYS_EXIT
         mov   ebx, RET_EXIT
         int   SYS_CALL

adicionar:
         mov   ecx, p1                 ; Processo Adicionar
         call  mst_saida

         mov   ecx, msgR               ;  Resultado
         call  mst_saida

         mov   dword [res], 0          ; Initialize res to 0

         lea   esi, [num1]
         call  str_to_int
         mov   ebx, [res]              ; Load current res 
         add   ebx, eax                ; Add num1 to ebx
         mov   [res], ebx              ; Store back

         lea   esi, [num2]
         call  str_to_int
         mov   ebx, [res]              ; Load current res 
         add   ebx, eax                ; Add num2 to ebx
         mov   [res], ebx              ; Store back

         mov   eax, [res]              ; Move result to eax int_to_str
         lea   esi, [BUFFER]           ; Use BUFFER from bibliotecaE
         call  int_to_str              ; Convert to string
         call  mst_saida               ; Display the result

         jmp   saida

subtrair:
         mov   ecx, p2                 ; Processo Subtrair
         call  mst_saida

         mov   ecx, msgR               ; Resultado
         call  mst_saida

         mov   dword [res], 0          ; Initialize res to 0

         lea   esi, [num1]
         call  str_to_int
         mov   ebx, [res]              ; Load current res 
         add   ebx, eax                ; Add num1 from ebx
         mov   [res], ebx              ; Store back

         lea   esi, [num2]
         call  str_to_int
         mov   ebx, [res]              ; Load current res 
         sub   ebx, eax                ; Subtract num2 from ebx
         mov   [res], ebx              ; Store back

         mov   eax, [res]              ; Move result to eax int_to_str
         lea   esi, [BUFFER]           ; Use BUFFER from bibliotecaE
         call  int_to_str              ; Convert to string
         call  mst_saida               ; Display the result

         jmp   saida

multiplicar:
         mov   ecx, p3                 ; Processo Multiplicar
         call  mst_saida

         mov   ecx, msgR               ; Resultado
         call  mst_saida

         mov   dword [res], 0          ; Initialize res to 0

         lea   esi, [num1]
         call  str_to_int
         mov   ebx, [res]              ; Load current res 
         add   ebx, eax                ; Add num1 from ebx
         mov   [res], ebx              ; Store back

         lea   esi, [num2]
         call  str_to_int
         mov   ebx, [res]              ; Load current res 
         imul  ebx, eax                ; Multiply num2 with ebx
         mov   [res], ebx              ; Store back

         mov   eax, [res]              ; Move result to eax int_to_str
         lea   esi, [BUFFER]           ; Use BUFFER from bibliotecaE
         call  int_to_str              ; Convert to string
         call  mst_saida               ; Display the result

         jmp   saida

dividir:
         mov   ecx, p4                 ; Processo Dividir
         call  mst_saida

         mov   ecx, msgR               ; Resultado
         call  mst_saida

         mov   dword [res], 0          ; Initialize res to 0

         lea   esi, [num1]
         call  str_to_int
         mov   ebx, [res]              ; Load current res 
         add   ebx, eax                ; Add num1 to ebx (store divisor)
         mov   [res], ebx              ; Store back

         lea   esi, [num2]
         call  str_to_int
         mov   ebx, [res]              ; Load current res (divisor)
         mov   ecx, eax                ; ecx = divisor (num2)
         mov   eax, ebx                ; eax = dividend (num1)
         xor   edx, edx                ; Clear edx for division
         div   ecx                     ; Divide eax by ecx
         mov   [res], eax              ; Store back result

         mov   eax, [res]              ; Move result to eax
         lea   esi, [BUFFER]           ; Use BUFFER from bibliotecaE
         call  int_to_str              ; Convert to string
         call  mst_saida               ; Display the result

         jmp   saida

msterro:
         mov   ecx, msgEr
         call  mst_saida
         jmp   saida
