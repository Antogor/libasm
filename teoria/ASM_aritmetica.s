	; OPERACIONES EN REGISTRO
		; dec = a decremento, ej - 1 (dec eax)
		; inc = a incrementar, ej + 1 (inc eax)
		; add = a sumar, ej (add eax, ebx), el resultado se guarda en el primer registro marcado, en ese tcao eax
		; sub = a restar, ej sub eax, ebx
		; mul = multiplicar, el resultado se almacenara en ax (en su parte alta o edx) o en al (su parte baja)
		; imul = multiplicar con signo
		; div = division, el resultado se almacena en al, el residuo en ah 
		; idiv = division con signo

		section .data

msg db "La suma de 4+5 es:", 10, 13 ; para imprimir el salto de linea utilizamos 10 y 13
	; el 10 en binaria hace que vayamos al inicio de la linea y el 13 nos coloca una linea debajo de la linea del mensaje
	; tambien se puede poner en hexadecimal 0xA para el 10, 0xD para el 13
len equ $ - msg

		section .bss ; seccion para reservar memoria y guardar las variables no declaradas, necesarias para guardar los resultados
res resb 1 ; "nombre de la variable" instruccion (resb, reservar memoria), cantidad de espacios en memoria, en este caso: 1

		section .txt
		global _start

_start:
	; el orden aqui es importante, almacenamos los valores en lso registros, y estos cambian para poder llamar al programa etc
	; por eso en primer lugar imprimimos el mensaje inicial, luego hacemos la operacion, y por ultimo imprimimos el resultado

		; imprime el mensaje
		mov eax, 4
		mov ebx, 1
		mov ecx, msg
		mov edx, len
		int 0x80

		; operaciones
		mov eax, 4 ; damos valor al registro
		mov ebx, 5 ; damos valor al registro
		add eax, ebx ; sumamos
		add eax, '0' ; le agregamos el carecter nulo a eax para convertirlo en cadena y poder imprimir despues
		; esto es necesario para indicar que tipo de dato es, y como va a sarli por pantalla no es un entero, es una cadena
		mov [res], eax ; rest guarda el valor de eax, que tras la suma seria 9
		; los corchetes son para indicar que vamos a acceder al contenido de la direccion de memoria
		; sin corchetes lo que va a modificar es la propia direccion de memoria
		
		; imprimir el resultado
		mov eax, 4
		mov ebx, 1
		mov ecx, res
		mov edx, 1
		int 0x80
		
		;salida al sistema
		mov eax, 1
		int 0x80

