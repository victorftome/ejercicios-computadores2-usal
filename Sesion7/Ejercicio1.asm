	.area	PROG(ABS)

	.org	0x100
	
cadena:	.ascii	"Hola, mundo."
	.byte	10
	.byte	0

	.globl	programa

programa:
	ldx	#cadena

bucle:
	lda	,x+
	beq	acabar	; comprobamos que no es el caracter nulo, si lo es nos salimos del bucle
	sta	0xFF00	; En caso de que no sea nulo lo imprimimos por pantalla
	bra	bucle

acabar:
	clra
	sta	0xFF01

	.org	0xFFFE
	.word	programa
