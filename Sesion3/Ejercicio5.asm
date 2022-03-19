	.area	PROG (ABS)
	.org	0x100

c1:	.byte	0
c2:	.byte	0
c3:	.byte	0
c4:	.byte	0
temp:	.word	0

	.globl	programa

programa:
	lda	0xFF02
	suba	#'0
	sta	c4

	lda	0xFF02
	suba	#'0
	sta	c3

	lda	0xFF02
	suba	#'0
	sta	c2

	lda	0xFF02
	suba	#'0
	sta	c1

valores_cargados:
	lda	c4

	lsla
	lsla
	lsla
	lsla
	
	adda	c3

	ldb	c2

	lslb
	lslb
	lslb
	lslb

	addb	c1

	tfr	d,x

valores_bcd:
	; c4 x 1000 (250 * 2 * 2)
	lda	c4
	ldb	#250

	mul

	lslb
	rola

	lslb
	rola

	std	temp
	; C3 x 100
	lda	c3
	ldb	#100
	mul

	addd	temp
	std	temp

	; C2 x 10
	lda	c2
	ldb	#10
	mul

	addb	c1
	addd 	temp
acabar:
	clra
	sta	0xFF01

	.org	0xFFFE
	.word	programa
