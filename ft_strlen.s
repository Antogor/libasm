			section .text
			global	_ft_strlen

_ft_strlen:
			push	rbp
			mov		rbp, rsp
			push	rcx
			mov		rcx, 0
			cmp		BYTE [rdi + rcx], 0
			jne		while
			jmp		return

while:
			cmp		BYTE [rdi + rcx], 0
			je		return
			inc		rcx
			jmp		while

return:
			mov		rax, rcx
			pop		rcx
			mov		rsp, rbp
			pop		rbp
			ret

