	.area	prog(ABS)

fin		.equ	0xFF01
pantalla	.equ	0xFF00
teclado		.equ	0xFF02
pila		.equ	0xD000

	.org	0x100
	.globl	programa

cadenafija:	.asciz	"aaaabbbb"
lcn_max:	.byte	0

programa:
	lds	#pila
	ldx	#cadenafija
	jsr	lee_cadena

	ldx	#cadenafija
	jsr	imprime_cadena

	ldx	#cadenafija
	lda	#5
	jsr	lee_cadena_n

	ldx	#cadenafija
	jsr	imprime_cadena

acabar:
	clra
	sta	fin

; subrutina imprime cadena
imprime_cadena:
	pshs	a

ic_sgte:
	lda	,x+
	beq	ic_ret
	sta	pantalla
	bra	ic_sgte

ic_ret:
	puls	a
	rts

; subrutina lee cadena
lee_cadena:
	pshs	a,x

lc_lectura:
	lda	teclado
	sta	,x+
	cmpa	#'\n
	bne	lc_lectura

	puls	a,x

	rts

; Subrutina lee n-caracteres !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
lee_cadena_n:
	pshs	b

	tsta
	beq	lcn_retorno

	deca
	sta	lcn_max
	clra

lcn_lectura:
	cmpa	lcn_max
	bhs	lcn_fin_lectura

	ldb	teclado
	stb	,x+

	cmpb	#'\n
	beq	lcn_fin_lectura_n

	inca
	bra	lcn_lectura

lcn_fin_lectura:
	clr	,-x

lcn_fin_lectura_n:
	clr	,-x
	bra	lcn_retorno

lcn_retorno:
	puls	b
	rts

	.org	0xFFFE
	.word	programa
