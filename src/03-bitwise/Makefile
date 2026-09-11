.PHONY: run test solution clean

FORMAT := elf32
LINK := ld -m elf_i386

starter: starter.asm
	nasm -f $(FORMAT) -g -F dwarf -o starter.o starter.asm
	$(LINK) -o starter starter.o

solution: solution.asm
	nasm -f $(FORMAT) -g -F dwarf -o solution.o solution.asm
	$(LINK) -o solution solution.o

run: starter
	qemu-i386 ./starter

test:
	./test.sh starter

clean:
	rm -f starter solution *.o actual.txt
