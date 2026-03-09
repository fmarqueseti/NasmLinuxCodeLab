global Question

segment .text

Question:
         mov   ebx, edi                   ; EDI is the first argument
         jmp   _testar
         ret

_testar:
         cmp   ebx, 0
         je    _par
         jl    _impar
         sub   ebx, 2                     ; Succesive subtractions of 2
         jmp   _testar

_par:
         mov   eax, 1                     ; EAX is the return value
         ret

_impar:
         mov   eax, 0                     ; EAX is the return value
         ret
