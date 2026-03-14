.SUFFIXES:
.SECONDARY:

%: %.o %.cpp
	@g++ $^ -o $@

%.o: %.asm
	@nasm -f elf64 $<

.PHONY: clean
clean:
	@rm -f *.o
