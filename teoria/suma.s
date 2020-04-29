		section .text
		global _suma

_suma:

		mov rax, rdi
		mov rax, rsi
		syscall
		ret