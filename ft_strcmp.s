global _ft_strcmp
_ft_strcmp:
	mov RAX, 0				; Initialize RAX to 0 for return from strloop
.strloop:
	cmpsb					; Compare string byte and increase ptrs
	jnz .notequal			; If not equal jump to difference calc routine
	cmp byte [RSI], 0		; Check for nullterm
	jne .strloop			; If not nullterm keep looping
	ret						; Return 0
.notequal:
	mov AL, byte [RDI - 1]	; Mov *s1 - 1 into AL register
	sub AL, [RSI - 1]		; Substract *s2 - 1 from AL
	ret						; Return value in AL
