			section .text
			global	_ft_strcmp

_ft_strcmp:
			push	rbp						; add rbp to the stack and move base pointer to this adress 
			mov		rbp, rsp				; to create a base where put the news "variables" that we are used in this function
			push	rcx   					; add rcx to stack
			mov		rcx, 0					; init the count to zero
			jmp		while

while:
			mov		dl, BYTE [rdi + rcx] 	; dl is the low part of rdx, dl = 1 byte (8 bits), rdx = 8 byte (64 bits)
			mov		dh, BYTE [rsi + rcx] 	; the same with dh, high part of rdx. Save de 1 byte character to 1 byte register
			cmp		dl, dh 					; compare the 2 chars of every string
			je		increase 				; conditional if the chars ar equal
			jl		lower 					; if the char in s1 is lower than char in s2 jump to lower
			jg		greater 				; if the char in s1 is greater than char in s2 jump to greater

increase: 									; increase count rcx if the chars ar equals
			cmp		dl, 0					; compare de actual char in s1 with char null
			je		null					; if is null, jump to null
			inc		rcx						; if not is null, increase rcx, and jump back to while and continue the loop
			jmp		while

null:										; method to know if one, or the two strings are in the null character
			cmp		dh, 0					; dl is = to null, here, compare if s2 is in null character too
			je		equal					; if s1 and s2 are in the null character in the same position, jump to equal
			cmp		dl, dh					; if not compare again the two characters, depends of the results, jump to lower (s1 < s2) o greater (s1 > s2)
			jl		lower
			jg		greater

equal:
			mov		rax, 0					; set register rax to 0 if s1 and s2 are equal
			jmp		return

lower:
			mov		rax, -1					; set rax to -1 if s1 < s2
			jmp		return

greater:
			mov		rax, 1					; set rax to 1 if s1 > s2
			jmp		return

return:										; method to back to main after the call function
			pop		rcx						; quit the rcx register to the stack
			mov		rsp, rbp				; move to stack pointer to the base
			pop		rbp						; quit base pointer to the stack, automatically, rsp will move in the stack to the adress with has the call function
			ret								; and then comeback to normally in the stack

