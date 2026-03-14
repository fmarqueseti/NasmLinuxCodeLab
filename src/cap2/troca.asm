section .text

global GetValorASM

GetValorASM:
         mov   eax, edi                    ; EDI is the first argument
                                           ; ESI is the 2nd, EDX 3rd...
                                           ; EAX is the return value
         add   eax, 1                      
         ret
