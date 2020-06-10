global _ft_strlen
_ft_strlen:
	mov AL, 0			; Set AL to 0 for string scan
	mov RCX, 0			; Set RCX to 0, this is our counter
.strloop:
	scasb				; Compare string byte and ++ RDI
	je .finalize		; Jump to finalize if NUL terminator is found
	add RCX, 1			; Add 1 to RCX counter
	jmp .strloop		; Jump to strloop if not found
.finalize:
	mov RAX, RCX		; Move counter into return register
	ret					; return
