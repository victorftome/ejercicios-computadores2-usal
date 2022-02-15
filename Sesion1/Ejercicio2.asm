	.area	PROG(ABS)
	.org	0x100
	.globl	programa

programa:
	lda	0xFF02	; Leemos los dos primeros numeros
	ldb	0xFF02

	tfr	d, s	; Movemos el contenido del d al s

	lda     0xFF02  ; Leemos otros dos primeros numeros
        ldb     0xFF02

	tfr 	d, u	; Movemos el contenido de d al u

	lda     0xFF02  ; Leemos otros dos primeros numeros
        ldb     0xFF02

	tfr	d, y	; Movemos el contenido de d al y

	lda     0xFF02  ; Leemos los dos primeros numeros
        ldb     0xFF02

	tfr	d, x	; Movemos el contenido del d al x

	lda     0xFF02  ; Leemos los dos ultimo numeros
        ldb     0xFF02

	stb	0xFF00	; Imprimimos el ultimo numero por pantalla
	sta	0xFF00	; Imprimimos el penultimo numero por pantalla

	tfr	x, d

	stb     0xFF00  ; Imprimimos el ultimo numero por pantalla
        sta     0xFF00  ; Imprimimos el penultimo numero por pantalla

	tfr	y, d

	stb     0xFF00  ; Imprimimos el ultimo numero por pantalla
        sta     0xFF00  ; Imprimimos el penultimo numero por pantalla

	tfr 	u, d

	stb     0xFF00  ; Imprimimos el ultimo numero por pantalla
        sta     0xFF00  ; Imprimimos el penultimo numero por pantalla

	tfr 	s, d

	stb     0xFF00  ; Imprimimos el ultimo numero por pantalla
        sta     0xFF00  ; Imprimimos el penultimo numero por pantalla

acabar:
	clra
	sta	0xFF01

	.org 	0xFFFE
	.word 	programa
