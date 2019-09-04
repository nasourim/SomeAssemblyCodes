section .text
global _start

_start:
    
    mov ecx,lenstr1
    mov edi,str1
    mov eax,str2
   repne scasd
   je found ; when found
   ; If not not then the following code
	
   mov eax,4
   mov ebx,1
   mov ecx,msg_notfound
   mov edx,len_notfound
   int 80h
   jmp exit
	
found:
   mov eax,4
   mov ebx,1
   mov ecx,msg_found
   mov edx,len_found
   int 80h
	
exit:
   mov eax,1
   mov ebx,0
   int 80h

section .data
    str1 db "Here is the string1",0xa ;string1
    lenstr1 equ $-str1
    str2 db "String2 Here" ;string2
    lenstr2 equ $-str2
    msg_notfound db "String2 not found in string1"
    len_notfound equ $-msg_notfound
    msg_found db "String2 Found in String1"
    len_found equ msg_found
