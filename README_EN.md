# NasmLinuxCodeLab

Repository dedicated to the practical implementation of the examples and exercises from the book:

> **Assembly na Prática – Version 1.0**  
> Author: Fernando Anselmo  

This project is part of my in-depth study journey in low-level programming using NASM in a Linux environment.

---

## 📚 Reference

Base material:

> **Assembly na Prática** – Version 1.0  
> Professor Fernando Anselmo  

The purpose of this repository is to apply, test, and consolidate the concepts presented in the book through direct hands-on coding practice.

---

## 🎯 Technical Objectives

- Understand the x86-64 (AMD64) architecture
- Work with registers and memory manipulation
- Implement Linux system calls (syscalls)
- Manually build ELF64 executables
- Develop low-level computational reasoning

---

## 🛠 Environment

- Operating System: Linux
- Assembler: NASM
- Linker: LD
- Architecture: x86-64 (AMD64)
- Executable Format: ELF64

---

## 📂 Project Structure
```
NasmLinuxCodeLab/
├── dia/                               # UML diagrams (DrawIO)
├── src/                               # NASM source code
├── img/                               # Images and visual resources
├── README.md                          # Language selector
├── README_BR.md                       # Brazilian Portuguese version
├── README_EN.md                       # This file
└── LICENSE                            # Project license
```

The directories follow the progressive organization of the studied content.

---

## ▶️ Build and Execution

To assemble and run a program:

```bash
$ nasm -f elf64 program.asm
$ ld -s -o program program.o
$ ./program
```