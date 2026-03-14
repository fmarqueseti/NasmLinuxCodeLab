.SUFFIXES:
.SECONDARY:

%: %.o
	@ld -s -o $@ $<

%.o: %.asm
	@nasm -f elf64 $<

.PHONY: clean
clean:
	@rm -f *.o
