global _ft_strcmp
_ft_strcmp:
	mov RAX, 0			; Initialize RAX to 0 for return from strloop
.strloop:
	cmpsb				; Compare string byte and increase ptrs
	jnz .notequal			; If not equal jump to difference calc routine
	cmp byte [RSI - 1], 0		; Check for nullterm
	jne .strloop			; If not nullterm keep looping
	cmp byte [RDI - 1], 0		; Check for null term in second str
	jne .strloop			; If not nullterm keep looping
	ret				; Return 0
.notequal:
	movzx R9, byte [RDI - 1]		; Mov *s1 - 1 into AL register
	movzx R10, byte [RSI - 1]
	cmp R9, R10		; Substract *s2 - 1 from AL
	jl .signed
	mov RAX, 1
	ret
.signed:
	mov RAX, -1
	ret
