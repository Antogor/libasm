section .text

global _restar

_restar:
		mov rax, rdi
		sub rax, rsi
		syscall
		ret
