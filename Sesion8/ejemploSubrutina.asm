	.area	PROG(ABS)

fin		.equ	0xFF01
pantalla	.equ	0xFF00
dirInicioPilaS	.equ	0xD000
dirInicioPilaU	.equ	0xE000

	.org	0x100
cadena:	.asciz	"Hola mundo.\n"

programa:
	lds	#dirInicioPilaS
	ldu	#dirInicioPilaU
	ldx	#cadena
	brs	imprime_cadena

	brs	acabar

acabar:
	clra
	sta	fin

	.org	0xFFFE
	.word	programa


imprime_cadena:
	pshu	a
sgte:
	lda	,x+
	beq	ret_imprime_cadena
	sta	pantalla
	bra	sgte

ret_imprime_cadena:
	pulu
	rts
