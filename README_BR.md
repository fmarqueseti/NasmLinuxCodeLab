# NasmLinuxCodeLab

Repositório dedicado à implementação prática dos exemplos e exercícios do livro:

> **Assembly na Prática – Versão 1.0**  
> Autor: Fernando Anselmo  

Este projeto integra minha jornada de aprofundamento em programação de baixo nível utilizando NASM em ambiente Linux.

---

## 📚 Referência

Material base:

> **Assembly na Prática** – Versão 1.0  
> Professor Fernando Anselmo  

O objetivo deste repositório é aplicar, testar e consolidar os conceitos apresentados no livro por meio da prática direta em código.

---

## 🎯 Objetivos Técnicos

- Compreender a arquitetura x86-64 (AMD64)
- Trabalhar com registradores e manipulação de memória
- Implementar chamadas de sistema (syscalls)
- Construir executáveis ELF64 manualmente
- Desenvolver raciocínio de baixo nível

---

## 🛠 Ambiente Utilizado

- Sistema Operacional: Linux
- Montador: NASM
- Linker: LD
- Arquitetura: x86-64 (AMD64)
- Formato do Executável: ELF64

---

## 📂 Estrutura do Projeto
```
NasmLinuxCodeLab/
├── dia/                               # Diagramas UML (DrawIO)
├── src/                               # Código-fonte nasm
├── img/                               # Imagens e recursos visuais
├── README.md                          # Seletor de idioma
├── README_BR.md                       # Este arquivo
├── README_EN.md                       # Versão em Inglês
└── LICENSE                            # Licença do projeto
```

Os diretórios seguem a organização progressiva do conteúdo estudado.

---

## ▶️ Compilação e Execução

O projeto utiliza um **Makefile** para automatizar o processo de montagem e linkedição.

Para compilar um programa:

```bash
$ make programa
```

O comando acima irá:
- Montar o arquivo `programa.asm` com `nasm -f elf64`
- Gerar o objeto `programa.o`
- Linkar o executável final `programa`

Para executar:

```bash
$ ./programa
```

🧹 Limpeza de Arquivos Objeto

Para remover todos os arquivos objeto (`*.o`) gerados durante a compilação:

```bash
$ make clean
```

Esse comando remove apenas arquivos intermediários, preservando os executáveis.
