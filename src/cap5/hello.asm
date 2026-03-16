section .data
         msg   db 'Hello World 64 bits!!!', 0xA
         tam   equ $-msg

section .text

global _start:

_start:
         mov   rax, 0x1                        ; Write Operation
         mov   rdi, 0x1                        ; Standard output
         mov   rsi, msg
         mov   rdx, tam
         syscall                               ; Interrupt call

         mov   rax, 0x3C                       ; Call code to terminate
         xor   rdi, rdi                        ; Return code (zero)
         syscall                               ; Interrupt call
