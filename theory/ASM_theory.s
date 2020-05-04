; las secciones pueden ir en el orden que queramos
		section 	.data ; maneja los datos del programa

msg db "hola mundo" ; msg = al nombre de la variable db es el = la asignacion, d de data (es un dato en bytes)

; db Data de len Byte
; dw Data de len Word
; dd Data de len Doble
; dq Data palabra cuadruple
; dt diez Byte

len equ $ - msg ; equ es la directiva que se usa para definir simbolos, es quivalente al = pero hace a esa variable constante


		section 	.text ; las instrucciones del programa
		global 		_start 

_start:
	; INSTRUCCIONES
		; mov traslada los datos de un lugar a otro, como un = mov destino, origen
	; REGISTROS
		; ax es la variable, acumulador, almacena el resultado de las operaciones
		; bx registro base
		; cx es el contador
		; dx datos
		; pueden ser divididos en dos registros de 8 bis ah (high bits) al (low bits)
		; el prefijo 'e' 'r' etc se utiliza dependiendo de la arquitectura, en el caso de intel 'e' es de 32 bits y r es de 64
		mov eax, 4 ; el 4 es la llamada al sistema write
		mov ebx, 1 ; el 1 indica la salida de pantalla, el 1
		mov ecx, msg ; que vamos a escribir
		mov edx, len ; longitud de lo que vamos a escribir
		int 0x80 ; interrupcion, pausa del programa para que haga lo que hemos programado
		; 0x80 es para llamar al sitema, este recupera el control y en este caso escribiria el mensaje
		mov eax, 1 ; el 1 es la llamada a la salida del sistema, el return (0) de C
		int 0x80 ; la interrupcion para que el programa haga la instruccion


