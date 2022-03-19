	.area	PROG(ABS)

	.org	0x100
	.globl	programa

programa:
	lda	#9

bucle:
	tfr	a,b
	addb	#'0
	stb	0xFF00
	suba	#1 ; Usamos sub a ya que afecta al bit de control C
	bmi	acabar ; Podemos sustituir estas dos opciones por bpl
	bra	bucle

acabar:
	clra
	sta	0xFF01

	.org	0xFFFE
	.word	programa
