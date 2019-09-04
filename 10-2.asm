section	.text
   global _start   ;must be declared for linker (ld)
	
_start:	
    		
   mov  eax,0      ;EBX will store the 
   mov  ecx, x     ;ECX will point to the current element to be summed
    call arraySum
arraySum:
top:  add  eax, [ecx]

   add  ecx,1      ;move pointer to next element
   cmp ecx,0
   jnb top

done: 

   add   eax, '0'
   mov  ebx,xno
   mov  [sum], ebx ;done, store result in "sum"
   mov  eax,[sum]
   sub  eax, '0'
   div  ebx
   add  eax, '0'
   mov	[average], ebx

ret

display:

	mov eax, 4
	mov ebx, 1
	mov ecx, userMsg
	mov edx, lenUserMsg
	int 80h  

   mov  edx,4      ;message length
   mov  ecx, sum   ;message to write
   mov  ebx, 1     ;file descriptor (stdout)
   mov  eax, 4     ;system call number (sys_write)
   int  0x80       ;call kernel
   
   mov eax, 4
	mov ebx, 1
	mov ecx, dispMsg
	mov edx, lenDispMsg
	int 80h  

   mov  edx,4      ;message length
   mov  ecx, average   ;message to write
   mov  ebx, 1     ;file descriptor (stdout)
   mov  eax, 4     ;system call number (sys_write)
   int  0x80       ;call kernel
	
   mov  eax, 1     ;system call number (sys_exit)
   int  0x80       ;call kernel


section	.data
global x
x db 17, 16, 15, 20, -1

xno db 5

	
userMsg db 'The Summation is: ' ;Message
   lenUserMsg equ $-userMsg             ;The length of the message
   dispMsg db 'And the Average is: '
   lenDispMsg equ $-dispMsg 
   
   
   section .bss
   sum resd 1
   average resd 0