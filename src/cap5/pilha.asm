%include 'bibliotecaE.inc'

section .data
         liv1  db '1. Moby Dick', LF, NULL
         liv2  db '2. Tom Swayer', LF, NULL
         liv3  db '3. Duna', LF, NULL

section .text

global _start

_start:
         ; Colocar os livros na pilha
         push  liv1
         push  liv2
         push  liv3

         ; Pegar um livro da pilha
         pop   rdi
         call  _imprimir
         pop   rdi
         call  _imprimir
         pop   rdi
         call  _imprimir

         ; Finalizar
         mov   rax, SYS_EXIT
         xor   rdi, rdi              ; Zerar
         syscall
