all: 
	hw-c.bin

hw.s : hw.c 
	gcc -m16 -O0 -I. -Wall -fno-pic -fcf-protection=none  --freestanding -S hw.c -o hw.s

hw_utils.s  : hw_utils.c
	gcc -m16 -O0 -I. -Wall -fno-pic  -fcf-protection=none --freestanding -S hw_utils.c -o hw_utils.s

hw_rt0.s  : hw_rt0.c
	gcc -m16 -O0 -I. -Wall -fno-pic  -fcf-protection=none -S hw_rt0.c -o hw_rt0.s

hw.o hw_utils.o  hw_rt0.o : hw.s hw_utils.s hw_rt0.s 
	as --32 hw.s -o hw.o
	as --32 hw_utils.s -o hw_utils.o
	as --32 hw_rt0.s -o hw_rt0.o

hw-c.bin: %.bin :  hw.o hw_utils.o hw.ld | hw_rt0.o
	ld -melf_i386 -T hw.ld --orphan-handling=discard  $< -o $@

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

