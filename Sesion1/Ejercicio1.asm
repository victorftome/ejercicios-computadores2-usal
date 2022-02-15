	.area	PROG(ABS)
	.org	0x100
	.globl	programa

programa:
	lda	0xFF02	; Leemos el primer caracter por teclado
	ldb	0xFF02	; Leemos el segundo caracter por teclado

	stb	0xFF00	; Sacamos el primer caracter
	sta	0xFF00	; Sacamos el segundo caracter

	ldb	#'\n	; Almacenamos el salto de linea en b

	stb	0xFF00	; Sacamos el salto de linea

	beq	acabar	; Finalizamos el programa

acabar:
	clra
	sta 	0xFF01

	.org 	0xFFFE
	.word 	programa
