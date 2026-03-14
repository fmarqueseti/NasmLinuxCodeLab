global PassarParam

segment .text

PassarParam:
         mov   eax, edi                     ; EAX is the return value
                                            ; EDI is the first argument
         add   eax, esi                     ; ESI is the 2nd
         add   eax, edx                     ; EDX is the 3rd
         ret
