			section	.text
			global	_ft_strdup
			extern	_malloc
			extern	_ft_strlen

_ft_strdup:
			push	rbp
			mov		rbp, rsp
			push	rcx
			mov		rcx, 0
			call	_ft_strlen	; parameter is rdi (s1), len return in rax
			jmp		init_malloc	

init_malloc:
			inc		rax			; len of s1 + 1
			push	rdi			; save in the stack s1
			mov		rdi, rax	; rdi parameter of the call to malloc = rax (len of s1 + 1)
			call	_malloc		; malloc return a len in rax
			pop		rdi			; recover the original value of s1
			cmp		rax, 0		; compare if malloc faliled
			je		error
			jmp		copy

copy:
			mov		dl, BYTE [rdi + rcx]
			mov		BYTE [rax + rcx], dl
			cmp		dl, 0
			je		return
			jmp		increase

increase:
			inc		rcx
			jmp		copy

error:
			mov		rax, 0
			pop		rcx
			mov		rsp, rbp
			pop		rbp
			ret
return:
			pop		rcx
			mov		rsp, rbp
			pop		rbp
			ret
