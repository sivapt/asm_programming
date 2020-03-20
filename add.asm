.386
.model flat, c 
.code 
addASM proc
	push ebp;			; prologue
	mov ebp, esp;		; prologue

	mov eax, [ebp+8]	; eax='a'
	mov ecx, [ebp+12]	; ecx='b'
	mov edx, [ebp+16]	; edx='c'

	add eax, ecx;		; eax='a'+'b'	
	add eax, edx;		; eax='a'+'b'+'c'

	pop ebp;			; epilogue

	ret;
addASM endp
		end