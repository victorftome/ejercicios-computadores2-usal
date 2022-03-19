	.area	PROG(ABS)

	.org	0x100
	.globl	programa

programa:
	lda	#'a

bucle:
	sta	0xFF00
	adda	#1
	cmpa	#'z + 1
	bmi	bucle

acabar:
	clra
	sta	0xFF01

	.org	0xFFFE
	.word	programa
