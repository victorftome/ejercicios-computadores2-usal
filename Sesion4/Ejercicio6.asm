	.area	PROG(ABS)

	.org	0x100
	.globl	programa

programa:

bucle:
	lda	0xFF02
	cmpa	#'0
	blo	else
	cmpa	#'9
	bhi	else
	lda	#'1
	sta	0xFF00
	bra	acabar

else:
	lda	#'0
	sta	0xFF00

acabar:
	clra
	sta	0xFF01

	.org	0xFFFE
	.word	programa
