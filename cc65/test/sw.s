	.macpack	longbranch


;  ADDR AC XR YR SP 00 01 NV-BDIZC LIN CYC
;.;0800 00 00 0a f3 2f 37 00100010 000 003   A9 05      LDA #$05
;.;0802 05 00 0a f3 2f 37 00100000 000 005   A0 00      LDY #$00
;.;0804 05 00 00 f3 2f 37 00100010 000 007   C9 06      CMP #$06
;.;0806 05 00 00 f3 2f 37 10100000 000 009   8A         TXA
;.;0807 00 00 00 f3 2f 37 00100010 000 011   E9 00      SBC #$00
;.;0809 ff 00 00 f3 2f 37 10100000 000 013   70 02      BVS $080D
;.;080b ff 00 00 f3 2f 37 10100000 000 015   49 80      EOR #$80
;.;080d 7f 00 00 f3 2f 37 00100000 000 017   0A         ASL A
;.;080e fe 00 00 f3 2f 37 10100000 000 019   A9 00      LDA #$00
;.;0810 00 00 00 f3 2f 37 00100010 000 021   A2 00      LDX #$00
;.;0812 00 00 00 f3 2f 37 00100010 000 023   2A         ROL A
;.;0813 00 00 00 f3 2f 37 00100010 000 025   F0 05      BEQ $081A
;.;081a 00 00 00 f3 2f 37 00100010 000 028   A9 00      LDA #$00
;.;081c 00 00 00 f3 2f 37 00100010 000 030   4C 00 00   JMP $0000

;PC=0802 SP=0100 A=00 X=00 Y=00 P=06 -----IZ-  lda #05
;PC=0804 SP=0100 A=05 X=00 Y=00 P=04 -----I--  ldy #00
;PC=0806 SP=0100 A=05 X=00 Y=00 P=06 -----IZ-  cmp #06
;PC=0808 SP=0100 A=05 X=00 Y=00 P=84 N----I--  txa
;PC=0809 SP=0100 A=00 X=00 Y=00 P=06 -----IZ-  sbc #00
;PC=080B SP=0100 A=FF X=00 Y=00 P=44 -V---I--  bvs 080F
;PC=080F SP=0100 A=FF X=00 Y=00 P=44 -V---I--  asla
;PC=0810 SP=0100 A=FE X=00 Y=00 P=C5 NV---I-C  lda #00
;PC=0812 SP=0100 A=00 X=00 Y=00 P=47 -V---IZC  ldx #00
;PC=0814 SP=0100 A=00 X=00 Y=00 P=47 -V---IZC  rola
;PC=0815 SP=0100 A=01 X=00 Y=00 P=44 -V---I--  beq 081C
;PC=0817 SP=0100 A=01 X=00 Y=00 P=44 -V---I--  lda #01
;PC=0819 SP=0100 A=01 X=00 Y=00 P=44 -V---I--  jmp 0000


	.export		_main

.proc	_main: near

.segment	"CODE"

;
; i=5;
;
L0018:
	ldx     #$00
	lda     #$05
	ldy     #$00
;	jsr     staxysp
;
; if( i >= 6 )
;
			
;	ldy     #$01
;	jsr     ldaxysp

			
	cmp     #$06
	txa
	sbc     #$00
	bvs     L0022
	eor     #$80
L0022:	asl     a
	lda     #$00
	ldx     #$00
	rol     a
	beq     L0020

	lda #1 ; error !
	jmp 0
;
L0020:
	lda #0 ; ok
	jmp 0

.endproc
