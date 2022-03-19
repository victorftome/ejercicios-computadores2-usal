	.area	PROG(ABS)

	.org	0x100
	.globl	programa

programa:

bucle:
	lda	0xFF02
	sta	0xFF00
	cmpa	#'f
	bne	bucle

acabar:
	clra
	sta	0xFF01

	.org	0xFFFE
	.word	programa
