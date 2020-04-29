section .text
global _ft_write

_ft_write:
			mov rax, rdi
			mov rbx, rsi
			mov rcx, rdx

			mov rax, 1
			syscall
			ret
