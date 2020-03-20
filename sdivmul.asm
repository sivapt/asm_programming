.386
.model flat, c
.code 

; Return		: 0 (Error: Divide by 0) 
;				: 1  (Success) 
; Computation	: *prod (a*b) 
;				: *quot	(a/b)
;				: *rem	(a%b)				
;vc++ notion	: volatile regs (eax, ecx, edx) non-volatile regs (ebp, ebx, esi, edi) 

muldivASM proc
		push	ebp				; proc prologue
		mov		ebp, esp 
		push	ebx

		xor	 	eax, eax

		mov		ecx, [ebp+8]	; ecx = 'a'
		mov		edx, [ebp+12]	; edx = 'd'
		
		or		edx, edx		; check for div!0 
		jz		dividebyzero	;

		imul	edx, ecx		; edx = 'a * b'

		mov		ebx, [ebp+16]	; ebx = 'prod'
		mov		[ebx], edx		; *prod = 'a * b'

		mov		eax, ecx		; eax = 'a'
		cdq						; edx:eax = 'a' convert to quad from double word
	
		idiv    dword ptr [ebp+12]	; divisor at offset quotient in 'eax' reminder 'edx'
		mov		ebx, [ebp+20]	; ebx = 'quot' 
		mov		[ebx], eax		; store quotient
		mov		ebx, [ebp+24]	; ebx = 'rem'
		mov		[ebx], edx		; store reminder

		mov		eax, 1			; return 1 for success
 		
	dividebyzero:				; proc epilogue
		pop		ebx
		pop		ebp
		ret
			
muldivASM endp	
		end