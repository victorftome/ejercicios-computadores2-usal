	.module	cadenas

pantalla	.equ	0xFF00
	.globl	imprime_cadena

imprime_cadena:
        pshs    a

ic_sig:
        lda     ,x+
        beq     ic_retorno
        sta     pantalla
        bra     ic_sig

ic_retorno:
        puls    a
        rts

