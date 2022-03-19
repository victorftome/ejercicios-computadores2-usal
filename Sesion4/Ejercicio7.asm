	.area	PROG(ABS)

	.org	0x100
	.globl	programa

programa:
	ldb	#'\n
bucle:
	lda	0xFF02
	cmpa	#'0
	blo	check_minus
	cmpa	#'9
	bhi	check_minus
	lda	#'1
	stb	0xFF00
	sta	0xFF00
	bra	acabar

check_minus:
	cmpa 	#'a
	blo	check_mayus
	cmpa	#'z
	bhi	check_mayus
	lda	#'2
	stb	0xFF00
	sta	0xFF00
	bra	acabar

check_mayus:
	cmpa	#'A
	blo	else
	cmpa	#'Z
	bhi	else
	lda	#'3
	stb	0xFF00
	sta	0xFF00
	bra	acabar

else:
	lda	#'0
	stb	0xFF00
	sta	0xFF00

acabar:
	clra
	sta	0xFF01

	.org	0xFFFE
	.word	programa
