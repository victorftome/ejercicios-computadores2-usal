		.area PROG (ABS)

fin     	.equ 	0xFF01
teclado		.equ	0xFF02
pantalla	.equ 	0xFF00
pilau		.equ	0xF000

        	.org 	0x100	
        	.globl 	programa
programa:
	ldu	#pilau

bucle_lectura:
	lda	teclado
	cmpa	#'\n
	beq	bucle_salida

	cmpa	#'(
	beq	add_pila

	cmpa	#'[
	beq	add_pila

	cmpa	#'{
	beq	add_pila

	cmpa	#')
	beq	busca_pila1

	cmpa	#']
	beq	busca_pila2

	cmpa	#'}
	beq	busca_pila3

	ldb	#8
	stb	pantalla

	bra	bucle_lectura

busca_pila1:
	cmpu	#pilau
	beq	termina_mal

	pulu	a
	cmpa	#'(

	bne	termina_mal
	bra	bucle_lectura

busca_pila2:
        cmpu    #pilau
        beq     termina_mal

        pulu    a
        cmpa    #'[

        bne     termina_mal
        bra     bucle_lectura

busca_pila3:
        cmpu    #pilau
        beq     termina_mal

        pulu    a
        cmpa    #'{

        bne     termina_mal
        bra     bucle_lectura

add_pila:
	pshu	a
	bra	bucle_lectura

bucle_salida:
	cmpu	#pilau
	bne	termina_mal
	bra	acabar

termina_mal:
	lda	#'\n
	sta	pantalla

	lda	#'M
	sta	pantalla

	lda	#'A
	sta	pantalla

	lda	#'L
	sta	pantalla

acabar:
	lda 	#'\n
	sta	pantalla
	clra
	sta 	fin

	.org 	0xFFFE	; Vector de RESET
	.word 	programa
