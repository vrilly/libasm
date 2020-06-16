global _ft_read
extern ___error
_ft_read:
	push R15
	mov rax, 0x2000003
	syscall
	jnc .return
	mov R15, RAX
	call ___error
	mov [RAX], R15
	mov RAX, -1
.return:
	pop R15
	ret
