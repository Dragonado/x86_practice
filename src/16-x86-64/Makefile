.PHONY: run test solution clean

FORMAT := elf64
LINK := ld -m elf_x86_64

starter: starter.asm
	nasm -f $(FORMAT) -g -F dwarf -o starter.o starter.asm
	$(LINK) -o starter starter.o

solution: solution.asm
	nasm -f $(FORMAT) -g -F dwarf -o solution.o solution.asm
	$(LINK) -o solution solution.o

run: starter
	./starter

test:
	./test.sh starter

clean:
	rm -f starter solution *.o actual.txt

