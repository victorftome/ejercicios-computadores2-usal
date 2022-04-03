	.area	PROG(ABS)

	.org	0x100
	.globl	programa

num:	.word	0 ; Variable donde vamos a ir acumulando el numero

programa:
	; Dividimos 10000 en multiplicar 50 x 200
	; Dividimos 1000 en multiplicar 20 x 50

	; Leemos numero por teclado
	; Restamos el caracter 0 para obtener el numero
	; Al macenmos en b 50 y multiplicamos
	lda	0xFF02
	suba	#'0
	ldb	#50
	mul

	; Cargamos en D el numero final multiplicado por 200
	lda	#200
	mul

	std	num ; Almacenamos el resultado en la variable num

	; milesimas
	lda	0xFF02
	suba	#'0
	ldb	#20
	mul

	lda	#50
	mul

	; Sumamos num a d y almacenamos d a num
	addd	num ; D = D + num
	std	num ; num = D

	; centenas
	lda	0xFF02
	suba	#'0
	ldb	#100
	mul

	addd	num
	std	num

	; Decenas
	lda	0xFF02
	suba	#'0
	ldb	#10
	mul

	addd	num
	std	num

	clra

	; Unidades
	ldb	0xFF02
	subb	#'0

	addd	num
	std	num

	lda	#'\n
	sta	0xFF00

	bitb	#0x02 ; Los cuadrados perfecto SIEMPRE tiene el segundo bit menos significativo a 0
	bne	no_perfecto ; Si no es cero yasabemos que no es perfecto

	clra
	clrb

bucle:
	tfr	d,x
	mul

	cmpd	num ; Comparamos D con num

	beq	perfecto ; Comprobamos que sea perfecto
	bhi	no_perfecto ; Comprobamos que no sea perfecto

	tfr	x,d ; Recuperamos los valores antiguos de a y b que habiamos almacenado en x

	inca ; Incrementamos contador
	incb ; Incrementamos contador

	bra	bucle

perfecto:
	lda 	#'S
	sta	0xFF00

	lda	#'I
	sta	0xFF00

	bra	acabar

no_perfecto:
	lda	#'N
	sta	0xFF00

	lda	#'O
	sta	0xFF00

acabar:
	lda	#'\n
	sta	0xFF00

	clra
	sta	0xFF01

	.org	0xFFFE
	.word	programa
