	.file	"hw_utils.c"
	.code16gcc
	.text
	.globl	print_str
	.type	print_str, @function
print_str:
.LFB0:
	.cfi_startproc
#APP
# 2 "hw_utils.c" 1
	   mov     %cx, %bx            
   mov     $0x0e, %ah          
   mov     $0x0, %si           
loop:                          
   mov     (%bx, %si), %al     
   cmp     $0x0, %al           
   je      end                 
   int     $0x10               
   add     $0x1, %si           
   jmp     loop                
end:                           
   mov     %si, %ax            
   ret                         

# 0 "" 2
#NO_APP
	nop
	ud2
	.cfi_endproc
.LFE0:
	.size	print_str, .-print_str
	.ident	"GCC: (GNU) 12.2.1 20221121 (Red Hat 12.2.1-4)"
	.section	.note.GNU-stack,"",@progbits
