section .text
   global _start            ;must be declared for using gcc
	
_start:                     ;tell linker entry point
	
	mov edx,7
	mov eax, 0
	mov ebx, 0
	mov  ecx, x     ;ECX will point to the current element to be summed
call findOddsNEvens
findOddsNEvens:
top:  
	
   test   ecx, 1              ;and ax with 1
   jz    evensadd
   jnz	oddsadd
   numbersloop:
   add  ecx,1      ;move pointer to next element
   cmp ecx,0
   dec edx
   jnz top
   
   mov ecx,2
   
   
   add ebx,'0'
   add eax,'0'
   
   mov [x_even],ebx
   mov [x_odd],eax
   
   mov   eax, 4             ;system call number (sys_write)
   mov   ebx, 1             ;file descriptor (stdout)
   mov   ecx, msg1       ;message to write
   mov   edx, lenmsg1          ;length of message
   int   0x80               ;call kernel
   
   mov   eax, 4             ;system call number (sys_write)
   mov   ebx, 1             ;file descriptor (stdout)
   mov   ecx, x_even       ;message to write
   mov   edx, 1          ;length of message
   int   0x80               ;call kernel
   
   mov   eax, 4             ;system call number (sys_write)
   mov   ebx, 1             ;file descriptor (stdout)
   mov   ecx, msg2       ;message to write
   mov   edx, lenmsg2          ;length of message
   int   0x80               ;call kernel
   
   mov   eax, 4             ;system call number (sys_write)
   mov   ebx, 1             ;file descriptor (stdout)
   mov   ecx, x_odd       ;message to write
   mov   edx, 1          ;length of message
   int   0x80               ;call kernel
   
   mov   eax, 4             ;system call number (sys_write)
   mov   ebx, 1             ;file descriptor (stdout)
   mov   ecx, msg3       ;message to write
   mov   edx, lenmsg3          ;length of message
   int   0x80               ;call kernel
   
ret

   jmp   exit

evensadd:   
  
	inc ebx
	jmp numbersloop
   
oddsadd:   
  
   inc eax
	jmp numbersloop

exit:

   mov   eax,1              ;system call number (sys_exit)
   int   0x80               ;call kernel

section   .data
x db 1,2,3,4,8,9,7
lenx db 7

x_even db 0
x_odd db 0

msg1 db "X has "
lenmsg1 equ $-msg1

msg2 db " Even Numbers And "
lenmsg2 equ $-msg2

msg3 db " Odd Numbers "
lenmsg3 equ $-msg3