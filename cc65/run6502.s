 
	.export _run6502_putchar

_run6502_putchar:
	jsr $ff00
;	ldx #0
	clc
	rts

	.export _run6502_getchar

_run6502_getchar:
	jsr $ff01
;	ldx #0
	clc
	rts

	.export _run6502_logerror

_run6502_logerror:
	jmp $ff02

