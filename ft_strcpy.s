			section .text
			global	_ft_strcpy

_ft_strcpy:
			push	rbp
			mov		rbp, rsp
			push	rcx
			mov		rcx, 0
			cmp		BYTE [rsi + rcx], 0		; compare is s2 are empty
			je		return
			jmp		while					; jump to loop

while:
			mov		dl, BYTE [rsi + rcx]	; save de char in dl (tmp)
			mov		BYTE [rdi + rcx], dl	; copy de char in dl in s1[0]
			cmp		dl, 0
			je		return
			jmp		increase

increase:
			inc		rcx
			jmp		while				


;null:										; if can't make a copy, return original s1
;			pop		rcx
;			mov		rsp, rbp
;			pop		rbp
;			mov		rax, rdi
;			ret

return:
			mov		rax, rdi
			pop		rcx
			mov		rsp, rbp
			pop		rbp
			ret
