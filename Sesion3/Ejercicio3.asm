	.org	0x100

n1:	.byte	0
n2:	.byte	0
op:	.byte	0

programa:
	lda	0xFF02
	suba	#'0	; Le restamos el codigo ASCII del 0 para obtener el numero obtenido

	; nos llevamos el cuarteto a la parte alta
	lsla
	lsla
	lsla
	lsla
	sta	n1

	lda	0xFF02
	suba	#'0

	; Dejamos el cuarteto en la parte baja. Y le sumamos n1
	adda	n1
	sta	n1
	lda	#32
	sta	0xFF00

	
