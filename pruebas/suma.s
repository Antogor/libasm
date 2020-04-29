		section .text
		global _suma

_suma:
		mov rax, rdi
		add rax, rsi
		syscall
		ret
