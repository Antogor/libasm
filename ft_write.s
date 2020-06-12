			section	.text
			global	_ft_write
			extern	___error

_ft_write:
			mov		rax, 0x2000004		; call to syscall write
			syscall						; make write
			cmp		rax, 9				; the value of rax will change depende of the syscall, and test if it is fine or not
			je		bad_fd
			cmp		rax, 14
			je		bad_address
			ret

bad_address:
			push	rbp					; push to the stack rbp
			mov		rbp, rsp			; save in rbp the rbp memory addres
			call	___error			; call function ___error and return the errno memory address and save it in rax
			mov		QWORD [RAX], 14		; set errno to the correcto value of the error, this is the same that *rax = errno, change the content of the memory address
			mov		rax, -1				; delete the previous value of rax, the errno memmory addres, and set rax to -1
			mov		rsp, rbp			; restart the stack previous to call ___error function
			pop		rbp					; pop rbp out of the stack
			ret

bad_fd:
			push	rbp
			mov		rbp, rsp
			call	___error
			mov		QWORD [RAX], 9
			mov		rax, -1
			mov		rsp, rbp
			pop		rbp
			ret
