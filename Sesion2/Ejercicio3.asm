	.area	PROG(ABS)
	.org	0x100

uno:	.word	0x102A
dos:	.word 	0x201A

prod1:	.word	0
prod2:	.word	0
prod3:	.word	0
prod4:	.word	0

resultado2: .word 0
resultado1: .word 0

	.globl 	programa

programa:
	; Productos
	lda	dos+1
	ldb	uno+1
	mul
	std	prod1

	lda	dos+1
	ldb	uno
	mul
	std 	prod2

	lda	dos
	ldb	uno+1
	mul
	std	prod3

	lda 	dos
	ldb	uno
	mul
	std	prod4

	; Sumas
	lda	prod1+1
	sta	resultado1+1

	ldx	#0
	ldb	prod1

	abx

	ldb	prod2+1
	abx

	ldb	prod3+1
	abx

	tfr 	x, d
	stb	resultado1

	ldx 	prod4
	tfr	a, b

	abx

	ldb	prod2
	abx

	ldb	prod3
	abx

	stx	resultado2	
acabar:
	clra
	sta	0xFF01

	.org	0xFFFE
	.word	programa
