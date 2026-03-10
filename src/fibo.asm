section .text

global Fibonacci

Fibonacci:
         mov   eax, 1                       ; EAX is the return value
         mov   r8d, 1                       ; 1st fibo sequence element
         mov   r9d, 1                       ; 2nd fibo sequence element

Calcular:
         sub   edi, 1                       ; EDI is the first argument
         cmp   edi, 0
         je    Terminar

         mov   eax, r8d
         add   eax, r9d                     ; Add the last two elements

         mov   r8d, r9d                     ; Update the last elements
         mov   r9d, eax                     ; Update the last elements
         jmp   Calcular

Terminar:
         ret
