			section .text
			global	_ft_strcpy

_ft_strcpy:
			push	rbp
			mov		rbp, rsp
			push	rcx
			mov		rcx, 0
			cmp		rsi, 0					; compare is s1 are empty
			je		return
			jmp		while					; jump to loop

while:
			mov		dl, BYTE [rsi + rcx]	; save de char in dl (tmp)
			mov		BYTE [rdi + rcx], dl	; copy de char in dl in s2[0]
			cmp		dl, 0
			je		return
			jmp		increase

increase:
			inc		rcx
			jmp		while				


return:
			mov		rax, rdi
			pop		rcx
			mov		rsp, rbp
			pop		rbp
			ret
