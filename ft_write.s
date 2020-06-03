			section	.text
			global	_ft_write
			extern	_errno
			

_ft_write:
			cmp		rdi, 0
			jz		null
			mov		rax, 0x2000004
			syscall
			cmp		rax, 9
			je		bad_fd
			ret

bad_fd:
		;	push	rbp
		;	mov		rbp, rsp
			call	_errno
		;	mov		rsp, rbp
		;	pop		rbp
		;	mov		rax, -1
			ret

null:
			mov		rax, -1
			ret

