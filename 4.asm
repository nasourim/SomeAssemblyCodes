section .text
global _start
_start:
    mov eax,str2
    mov ebx,str1
    mov ecx,lenstr2
    add ecx,str1
    mov [str3],ecx
    
    mov eax,lenstr1
    add eax,lenstr2
    mov [lenstr3],eax
    
    mov eax,4
    mov ebx,1
    mov ecx,msg1
    mov edx,lenmsg1
    int 0x80
    
    mov eax,4
    mov ebx,1
    mov ecx,str1
    mov edx,lenstr1
    int 0x80
    
    mov eax,4
    mov ebx,1
    mov ecx,msg2
    mov edx,lenmsg2
    int 0x80
    
    mov eax,4
    mov ebx,1
    mov ecx,str2
    mov edx,lenstr2
    int 0x80
    
    mov eax,4
    mov ebx,1
    mov ecx,msg3
    mov edx,lenmsg3
    int 0x80
    
    mov eax,4
    mov ebx,1
    mov ecx,str3
    mov edx,lenstr3
    int 0x80

exit:
   mov eax,1
   mov ebx,0
   int 0x80

section .data
    str1 db "the string1"
    lenstr1 equ $-str1
    
    str2 db "The String2"
    lenstr2 equ $-str2
    
    str3 resb ''
    lenstr3 db 0
    
    msg1 db "String1 is:"
    lenmsg1 equ $-msg1
    
    msg2 db "String2 is:"
    lenmsg2 equ $-msg2
    
    msg3 db "String3 is:"
    lenmsg3 equ $-msg3
    
    