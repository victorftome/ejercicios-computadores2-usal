        .area 	PROG (ABS)

fin     .equ 	0xFF01

        .org 	0x100

uno: 	.word 	0x01A3
dos: 	.byte 	0xB1

suma1:  .word 	0
suma2:	.word 	0

        .globl 	programa

programa:
	; Sin signo
	ldx	uno	; almacenamos el valor de 16 bits en el registro X
	ldb	dos	; almacenamos el valor de 8 bits en el registro b

	abx		; Sumamos B a X

	stx 	suma1	; Almacenamos x en suma1

	ldb	dos	; Almacenamos el valor de dos en b
	sex		; Corremos el signo para todo el d

	addd	uno	; Le sumamos uno a d

	std	suma2	; Almacenamos el contenido en la suma dos
acaba:
        clra
        sta	0xFF01

        .org 	0xFFFE
        .word 	programa
