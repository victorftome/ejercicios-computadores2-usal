	.area	prog(ABS)

fin		.equ	0xFF01
pantalla	.equ	0xFF00
teclado		.equ	0xFF02
pila		.equ	0xD000

	.org	0x100
	.globl	programa

programa:
	lds	#pila

acabar:
	clra
	sta	fin

; Entrada: D
; Registro: CC
imprime_decimal:
	pshs	x,d
	ldx	#0

id_primera_cifra:
	cmpd	#10000
	blo	id_imprime_primera_cifra
	subd	#10000
	exg	x,d
	incb
	exg	x,d
	beq	id_primera_cifra

id_imprime_primera_cifra:
	exg	x,d
	addb	#'0
	stb	pantalla
	exg	x,d

; Las demas seria lo mismo pero con menor cantidad
id_quinta_cifra:
	addb	#'0
	stb	pantalla

	puls	x,d

	rts

	.org	0xFFFE
	.word	programa
