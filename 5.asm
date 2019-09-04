section .text
global _start
_start:
    
    mov  ecx,5      ;number bytes to be summed 
    

top:  
    mov  ebx,0      ;EBX will store the sum
    add  ebx,no1
    add  ebx,no2
    mov  [sum],ebx
    
    dec  ecx        ;decrement counter
    jnz  top        ;if counter not 0, then loop again
    

exit:
   mov eax,1
   mov ebx,0
   int 0x80

section .data
    no1 dd 3
    
    no2 dd 2
    
    sum dd 0
    
    
    