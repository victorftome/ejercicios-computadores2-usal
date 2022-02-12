; Hola mundo en ensamblador (MC6809)

	.area PROG (ABS)
	.org  0x100
cadena: .ascii "Hola, mundo."
	.byte	10	; 10 es CTRL-J: salto de linea
	.byte	0	; 0 es CTRL-@: fin de cadena

	.globl 	programa

programa:
	ldx 	#cadena

bucle:	lda	,x+
	beq	acabar
	sta	0xFF00	; Salida por pantalla
	bra	bucle

acabar:	clra
	sta	0xFF01

	.org	0xFFFE	; Vector de RESET
	.word	programa
