	.area	PROG(ABS)
fin		.equ	0xFF01
pantalla	.equ	0xFF00
	.org	0x100

cadena:
	.asciz	"Hola mundo"

	.globl	imprime_cadena
	.globl	programa

programa:
	lds	#0xF000
	ldx	#cadena
	jsr	imprime_cadena

acabar:
	clra
	sta	fin

	.org	0xFFFE
	.word	programa
