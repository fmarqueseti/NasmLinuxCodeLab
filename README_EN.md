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

The project uses a **Makefile** to automate the assembling and linking process.

To build a program:

```bash
$ make program
```

This command will:
- Assemble `program.asm` using `nasm -f elf64`
- Generate the object file `program.o`
- Link the final executable `program`

To run:

```bash
$ ./program
```

🧹 Cleaning Object Files

To remove all generated object files (`*.o`):

```bash
$ make clean
```

This command removes only intermediate files while preserving the generated executables.
