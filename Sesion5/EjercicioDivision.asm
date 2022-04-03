	.area	PROG(ABS)

	.org	0x100
	.globl	programa


dividendo:	.word	0
divisor:	.word	0
ociente:	.word	0
resto:		.word 	0
col1:		.word 	0
col2:		.word	0

programa:
	ldd	#26 ; 0x001A
	ldx	#1257 ; 0x04E9

	; Inicializamos las variables
	std	divisor
	std	col1

	stx	dividendo
	stx	resto

	ldd	#1
	std	col2

	ldd	#0
	std	cociente

bucle1:
	cmpx	col1
	bls	bucle2

	lsl	col1 + 1
	rol	col1

	lsl	col2 + 1
	rol 	col2

	bra	bucle1

bucle2:
	ldd	resto

	cmpd	col1
	blo	dividir

	subd	col1
	std	resto ; Resto -= col1

	ldd	cociente
	addd	col2
	std	cociente ; Cociente += col2

	ldd 	col2
	cmpd	#1
	beq	fin_division ; comprobamos que sea igual a dos, si es igual salimos

	bra	bucle2

dividir:
	lsr	col1
	ror	col1 + 1

	lsr 	col2
	ror	col2 + 1

	bra bucle1;

fin_division:
	

acabar:
	clra
	sta	0xFF01

	.org	0xFFFE
	.word 	programa
