global _ft_strcpy
_ft_strcpy:
	mov RAX, RDI		; Store original dst ptr in RAX to return
.strloop:
	movsb				; Copy one string byte and increase ptrs in RDI and RSI
	cmp byte [RSI], 0	; Compare byte in [RSI] data to 0
	jne .strloop		; Jump to strloop if not equal
	ret					; return
