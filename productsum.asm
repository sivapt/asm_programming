.386
.model flat, c
.code
; proc prologue 
productsumASM	proc
	push	ebp	
	mov		ebp, esp
	sub		esp, 12		; reserve 12B temporary storage
	push	ebx			; non-volatile regs stored in stack
	push	esi
	push	edi	

	mov		eax, [ebp + 8]	;	eax = 'a'
	mov		ebx, [ebp + 12]	;	ebx	= 'b'
	mov		ecx, [ebp + 16]	;	ecx = 'c' 
	mov		edx, [ebp + 20] ;   edx = '*s1' 
	mov		esi, [ebp + 24] ;   esi = '*s2'
	mov		edi, [ebp + 28] ;   edi = '*s3' 

	; s1 = a + b + c 
	mov		[ebp - 4], eax  ;  local s1 = 'a'; 
	add		[ebp - 4], ebx	;  local s1 = 'a' + 'b' 
	add		[ebp - 4], ecx	;  local s1 = 'a' + 'b' + 'c'

	; s2 = a^2 + b^2 + c^2 
	imul	eax, eax		; eax = 'a' * 'a'
	imul	ebx, ebx		; ebx = 'b' * 'b'
	imul	ecx, ecx		; ecx = 'c' * 'c'
	mov		[ebp - 8], eax  ; local s2 = a*a 
	add		[ebp - 8], ebx  ; local s2 = a*a + b*b 
	add		[ebp - 8], ecx  ; local s2 = a*a + b*b  + c*c

	; s3 = a^3 + b^3 + c^3 
	imul	eax, [ebp + 8]	; eax = 'a' * 'a' * 'a'
	imul	ebx, [ebp + 12]	; ebx = 'b' * 'b' * 'b'
	imul	ecx, [ebp + 16]	; ecx = 'c' * 'c' * 'c'
	mov		[ebp - 12], eax  ; local s3 = a*a*a 
	add		[ebp - 12], ebx  ; local s3 = a*a*a + b*b*b 
	add		[ebp - 12], ecx  ; local s3= a*a*a + b*b*b  + c*c*c

	mov		eax, [ebp - 4]	; eax = local s1	
	mov		[edx], eax		; *s1 = 'a' + 'b' + 'c'
	mov		eax, [ebp - 8]	; eax = local s2
	mov		[esi], eax		; s2 = a*a + b*b  + c*c
	mov		eax, [ebp - 12]	; eax = local s2
	mov		[edi], eax		; s3 = a*a*a + b*b*b  + c*c*c

; proc	epilogue
	pop	edi
	pop esi
	pop ebx
	mov esp, ebp
	pop	ebp
	ret 
	
productsumASM	endp
		end