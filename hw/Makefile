all:
	make hw-hex.bin
	make hw-s.bin

hw-hex.bin : ./hex/hw.hex
	./tools/hex2bin ./hex/hw.hex hw-hex.bin

hw-s.bin : ./assembly/hw.S
	as --32 ./assembly/hw.S -o hw-s.o
	ld -melf_i386 --oformat=binary -Ttext=0x7c00 hw-s.o -o hw-s.bin

hex2bin : ./tools/hex2bin.c
	gcc -o ./tools/hex2bin ./tools/hex2bin.c

.PHONY: clean

clean:
	rm -rf *.bin *.o *.s hex2bin

%/run : %
	@i=$< &&\
	if test $${i##*.} = "img"; then\
	    make run-fd IMG=$<;\
	 else\
	   if test $${i##*.} = "bin"; then\
	     make run-bin IMG=$<;\
	    fi;\
	fi

%/bin : %
	make run-bin IMG=$<

run-bin: $(IMG)
	qemu-system-i386 -drive format=raw,file=$< -net none

