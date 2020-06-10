global _ft_strdup
extern _malloc
_ft_strdup:
	mov RCX, 0
	push RDI
.count:
	inc RCX
	cmp byte [RDI], 0
	jz .allocate
	inc RDI
	jnz .count
.allocate:
	mov RDI, RCX
	call _malloc
	cmp RAX, 0
	jne .copy
	ret
.copy:
	pop RSI
	mov RDI, RAX
	mov RBX, RAX
.copy_loop:
	movsb
	cmp byte [RSI], 0
	jne .copy_loop
	mov RAX, RBX
	ret
