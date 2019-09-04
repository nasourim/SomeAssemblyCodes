section	.text
   global _start   ;must be declared for linker (ld)
	
_start:	
 		
   mov  eax,10      ;number bytes to be summed 
   mov  ebx,0      ;EBX will store the sum
   mov  ecx, x     ;ECX will point to the current element to be summed

top:  add  ebx, [ecx]

   add  ecx,1      ;move pointer to next element
   dec  eax        ;decrement counter
   jnz  top        ;if counter not 0, then loop again

done: 

   add   ebx, '0'
   mov  eax,xno
   mov  [sum], ebx ;done, store result in "sum"
   mov  ebx,[sum]
   sub  ebx, '0'
   div  eax
   add  ebx, '0'
   mov	[average], ebx

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
x:    
   dd  12
   dd  16
   dd  18
   dd  20
   dd  17
   dd  19
   dd  19.5
   dd  18.25
   dd  17.5
   dd  17

xno:
	dd 10

sum: 
   dd  0
   
average:
	dd 0
	
userMsg db 'The Summation is: ' ;Message
   lenUserMsg equ $-userMsg             ;The length of the message
   dispMsg db 'And the Average is: '
   lenDispMsg equ $-dispMsg 