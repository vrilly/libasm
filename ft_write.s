global _ft_write
extern ___error
_ft_write:
	push R15
	mov rax, 0x2000004
	syscall
	jnc .return
	mov R15, RAX
	call ___error
	mov [RAX], R15
	mov RAX, -1
.return:
	pop R15
	ret
