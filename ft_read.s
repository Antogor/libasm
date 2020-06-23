			section .text
			global	_ft_read
			extern	___error

_ft_read:
			cmp		edx, 0
			jl		len_error
			mov		rax, 0x2000003
			syscall
			jc		error
			ret

len_error:
			mov		rax, -1
			ret

error:
			cmp		rax, 9			
			je		bad_fd
			cmp		rax, 14
			je		bad_address

bad_address:
			push	rbp
			mov		rbp, rsp
			call	___error			; call function ___error and return the errno memory address and save it in rax
			mov		QWORD [RAX], 14		; set errno to the correcto value of the error, this is the same that *rax = errno, change the content of the memory address
			mov		rax, -1				; delete the previous value of rax, the errno memmory addres, and set rax to -1
			mov		rsp, rbp
			pop		rbp
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
