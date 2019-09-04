section .text
   global _start            ;must be declared for using gcc
	
_start:                     ;tell linker entry point
	
    mov	eax,x
    sub     eax, '0'
	
    mov 	edx, y
    sub     edx, '0'
    mul 	edx
    add	eax, '0'
	
   mov 	[z], eax
	
	mov   eax, 4             ;system call number (sys_write)
	mov   ebx, 1             ;file descriptor (stdout)
	mov   ecx, msg1       ;message to write
	mov   edx, lenmsg1          ;length of message
	int   0x80               ;call kernel
	
	mov   eax, 4             ;system call number (sys_write)
	mov   ebx, 1             ;file descriptor (stdout)
	mov   ecx, z       ;message to write
	mov   edx, 1         ;length of message
	int   0x80               ;call kernel

	mov   eax,1              ;system call number (sys_exit)
	int   0x80               ;call kernel

section   .data
x dw '9'
y dw '3'

msg1 db "Multiply: "
lenmsg1 equ $-msg1

segment .bss
z resb 1

