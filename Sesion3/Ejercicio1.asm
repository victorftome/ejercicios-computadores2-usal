	.area	PROG(ABS)
	.org	0x100
temp:	.word	0

	.globl	programa

programa:
	lda	#0x1c
	tfr	a,b

	; Desplazamos 4 veces a la derecha para obtener los 4 bits que dan el primer caracter hexadecimal
	; empezando por la izquierda. Pasamos el primer cuarteto de la parte alta a la baja
	lsrb
	lsrb
	lsrb
	lsrb

	std	temp
	clra
	addb	#246
	adca	#0	; Añadimos al acumulador A el acarreo obtenido previamente

	ldb	#7
	mul
	addb	temp+1	; Dígito + el acarreo por 7
	addb	#'0
	stb	0xFF00	; Escribimos el contenido de b en la pantalla

	ldb	temp	; Cargamos en b el valor original

	; Desplazamos 4 bits a la izquierda para quedarnos con la parte baja
	lslb
	lslb
	lslb
	lslb

	; Desplazamos 4 bits a la derecha para quedarnos con el cuarteto en la parte baja y lo demas a cero, eliminando asi el primero
	lsrb
	lsrb
	lsrb
	lsrb

	std	temp

	clra
	addb	#246
	adca	#0

	ldb	#7
	mul
	addb	temp+1
	addb	#'0
	std	0xFF00

acabar:
	clra
	sta	0xFF01

	.org	0xFFFE
	.word	programa
