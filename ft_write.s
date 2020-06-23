			section	.text
			global	_ft_write
			extern	___error

_ft_write:
			cmp		edx, 0				; compare if len sended is < 0
			jl		len_error
			mov		rax, 0x2000004		; call to syscall write
			syscall						; make write
			jc		error				; check if the carry flag is 1, its means that syscall has failed
			ret

len_error:
			mov		rax, -1
			ret

error:									; if syscall has failed compare the value of rax
			cmp		rax, 9				; 9 is a bad file descriptor
			je		bad_fd
			cmp		rax, 14				; 14 is a bad address
			je		bad_address

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
			mov	rsp, rbp
			pop	rbp
			ret
