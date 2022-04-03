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
	pshu	a
	bra	bucle_lectura

bucle_salida:
	cmpu 	#pilau
	beq	acabar
	pulu	a
	sta	pantalla
	bra	bucle_salida

acabar:
	lda 	#'\n
	sta	pantalla
	clra
	sta 	fin

	.org 	0xFFFE	; Vector de RESET
	.word 	programa
