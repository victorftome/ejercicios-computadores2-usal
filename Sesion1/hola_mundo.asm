; Hola mundo en ensamblador (MC6809)

	.area PROG (ABS) 	; Se declara el nombre del area donde ira el código, en este caso PROG.
						; También le hemos indicado el flag de ABS (absoluta)
	.org  0x100	; Establecemos el punto en ensamblado en la dirección indicada.
				; Esto lo podemos hacer ya que hemos establecido el area como ABS.

cadena: .ascii "Hola, mundo." ; Almacenamos la cadena "Hola, mundo."
	.byte	10	; 10 es CTRL-J: salto de linea
	.byte	0	; 0 es CTRL-@: fin de cadena

	.globl 	programa 	; Establecemos la etiqueta programa como una etiqueta compartida
						; De esta forma se podra exportar para usar en otros .asm

programa:
	ldx 	#cadena	; Cargamos el valor almacenado en cadena ("Hola, mundo. SALTO-LINEA FIN CADENA") en registros de 16 bits.

bucle:	lda	,x+
	beq	acabar
	sta	0xFF00	; Salida por pantalla
	bra	bucle

acabar:	clra
	sta	0xFF01

	.org	0xFFFE	; Vector de RESET
	.word	programa
