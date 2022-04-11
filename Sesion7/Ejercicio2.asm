	.area	PROG(ABS)

	.org	0x100
	
cadena:	.word	0xE000
menor:	.byte	255

	.globl	programa

programa:
	ldx	#cadena	; Hacemos que x apunte a la dir de cadena

bucle_lectura:
	lda	0xFF02
	sta	,x+	; Almacenamos a en la dir de x y la aumentamos en un byte la dir que apunta x.
	cmpa	#'\n	; comprobamos que se haya inroducido el enter
	bne	bucle_lectura
	clr	-1,x	; Acabamos la cadena con un 0. Tambien hubiese valido clr ,-x

busca_menor:
	lda	#255
	sta	menor
	ldx	#cadena

sigue_buscando:
	lda	,x+
	beq	fin_cadena_busqueda

	cmpa	#32	; Ignoramos el espacio
	beq	sigue_buscando

	cmpa	menor
	bhs	sigue_buscando
	sta	menor
	bra	sigue_buscando

fin_cadena_busqueda:
	ldb	#'\n
	stb	0xFF00

	cmpa	#255
	beq	acabar

	lda	menor
	sta	0xFF00

acabar:
	clra
	sta	0xFF01

	.org	0xFFFE
	.word	programa
