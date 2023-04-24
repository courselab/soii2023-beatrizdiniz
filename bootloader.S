## Boot, say hello, and halt (AT&T assembly)

.code16
.global _start
	
_start:	

        mov $0xe, %ah          # Seleciona a BIOS no modo tty
        mov $msg, %si          # Ponteiro na primeira posicao da string

loop:
        lodsb                  # Adicona a msg no registrador al e faz o incremento do poneiro em cada loop no si
	cmp   $0x0, %al	       # Verifica se chegou no 0 no fim da string
	je    halt             # Jump para halt se chegar no fim
	int   $0x10	       # Chama a BIOS
	jmp   loop	       # continua o loop


halt:
	hlt		        # Interrupcao do programa
	jmp   halt              # Medida de seguranca que garante a interrupcao do programa

msg:			       
	.asciz    "Hello World!!\r\n"      #String a ser exibida
        len = . - msg 
	.fill 510 - (. - _start), 1, 0  # Preenche o restante com 0
	.word 0xaa55			# Boot signature
