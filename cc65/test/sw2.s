	.macpack	longbranch
	.export		_main

;ADDR AC XR YR SP 00 01 NV-BDIZC LIN CYC
;0800 00 00 0a f3 2f 37 00100010 000 002   A9 90      LDA #$90
;0802 90 00 0a f3 2f 37 10100000 000 004   85 03      STA $03        ;PC=0802 SP=0100 A=90 X=00 Y=00 P=84 N-------  sta 03
;0804 90 00 0a f3 2f 37 10100000 000 007   A9 00      LDA #$00       ;PC=0804 SP=0100 A=90 X=00 Y=00 P=84 N-------  lda #00
;0806 00 00 0a f3 2f 37 00100010 000 009   85 02      STA $02        ;PC=0806 SP=0100 A=00 X=00 Y=00 P=06 ------Z-  sta 02
;0808 00 00 0a f3 2f 37 00100010 000 012   A9 FF      LDA #$FF       ;PC=0808 SP=0100 A=00 X=00 Y=00 P=06 ------Z-  lda #FF
;080a ff 00 0a f3 2f 37 10100000 000 014   85 05      STA $05        ;PC=080A SP=0100 A=FF X=00 Y=00 P=84 N-------  sta 05
;080c ff 00 0a f3 2f 37 10100000 000 017   A9 FF      LDA #$FF       ;PC=080C SP=0100 A=FF X=00 Y=00 P=84 N-------  lda #FF
;080e ff 00 0a f3 2f 37 10100000 000 019   85 04      STA $04        ;PC=080E SP=0100 A=FF X=00 Y=00 P=84 N-------  sta 04
;0810 ff 00 0a f3 2f 37 10100000 000 022   A2 FF      LDX #$FF       ;PC=0810 SP=0100 A=FF X=00 Y=00 P=84 N-------  ldx #FF
;0812 ff ff 0a f3 2f 37 10100000 000 024   A9 FF      LDA #$FF       ;PC=0812 SP=0100 A=FF X=FF Y=00 P=84 N-------  lda #FF
;0814 ff ff 0a f3 2f 37 10100000 000 026   48         PHA            ;PC=0814 SP=0100 A=FF X=FF Y=00 P=84 N-------  pha
;0815 ff ff 0a f2 2f 37 10100000 000 029   A5 02      LDA $02        ;PC=0815 SP=01FF A=FF X=FF Y=00 P=84 N-------  lda 02
;0817 00 ff 0a f2 2f 37 00100010 000 032   38         SEC            ;PC=0817 SP=01FF A=00 X=FF Y=00 P=06 ------Z-  sec
;0818 00 ff 0a f2 2f 37 00100011 000 034   E9 04      SBC #$04       ;PC=0818 SP=01FF A=00 X=FF Y=00 P=07 ------ZC  sbc #04
;081a fc ff 0a f2 2f 37 10100000 000 036   85 02      STA $02        ;PC=081A SP=01FF A=FC X=FF Y=00 P=84 N-------  sta 02
;081c fc ff 0a f2 2f 37 10100000 000 039   90 02      BCC $0820      ;PC=081C SP=01FF A=FC X=FF Y=00 P=84 N-------  bcc 0820
;0820 fc ff 0a f2 2f 37 10100000 000 042   C6 03      DEC $03        ;PC=0820 SP=01FF A=FC X=FF Y=00 P=84 N-------  dec 03
;0822 fc ff 0a f2 2f 37 10100000 000 047   A0 03      LDY #$03       ;PC=0822 SP=01FF A=FC X=FF Y=00 P=84 N-------  ldy #03
;0824 fc ff 03 f2 2f 37 00100000 000 049   A5 05      LDA $05        ;PC=0824 SP=01FF A=FC X=FF Y=03 P=04 --------  lda 05
;0826 ff ff 03 f2 2f 37 10100000 000 052   91 02      STA ($02),Y    ;PC=0826 SP=01FF A=FF X=FF Y=03 P=84 N-------  sta (02),Y
;0828 ff ff 03 f2 2f 37 10100000 000 058   88         DEY            ;PC=0828 SP=01FF A=FF X=FF Y=03 P=84 N-------  dey
;0829 ff ff 02 f2 2f 37 00100000 000 060   A5 04      LDA $04        ;PC=0829 SP=01FF A=FF X=FF Y=02 P=04 --------  lda 04
;082b ff ff 02 f2 2f 37 10100000 001 000   91 02      STA ($02),Y    ;PC=082B SP=01FF A=FF X=FF Y=02 P=84 N-------  sta (02),Y
;082d ff ff 02 f2 2f 37 10100000 001 006   88         DEY            ;PC=082D SP=01FF A=FF X=FF Y=02 P=84 N-------  dey
;082e ff ff 01 f2 2f 37 00100000 001 008   8A         TXA            ;PC=082E SP=01FF A=FF X=FF Y=01 P=04 --------  txa
;082f ff ff 01 f2 2f 37 10100000 001 010   91 02      STA ($02),Y    ;PC=082F SP=01FF A=FF X=FF Y=01 P=84 N-------  sta (02),Y
;0831 ff ff 01 f2 2f 37 10100000 001 016   88         DEY            ;PC=0831 SP=01FF A=FF X=FF Y=01 P=84 N-------  dey
;0832 ff ff 00 f2 2f 37 00100010 001 018   68         PLA            ;PC=0832 SP=01FF A=FF X=FF Y=00 P=06 ------Z-  pla
;0833 ff ff 00 f3 2f 37 10100000 001 022   91 02      STA ($02),Y    ;PC=0833 SP=0100 A=FF X=FF Y=00 P=84 N-------  sta (02),Y
;0835 ff ff 00 f3 2f 37 10100000 001 028   A2 00      LDX #$00       ;PC=0835 SP=0100 A=FF X=FF Y=00 P=84 N-------  ldx #00
;0837 ff 00 00 f3 2f 37 00100010 001 030   86 04      STX $04        ;PC=0837 SP=0100 A=FF X=00 Y=00 P=06 ------Z-  stx 04
;0839 ff 00 00 f3 2f 37 00100010 001 033   86 05      STX $05        ;PC=0839 SP=0100 A=FF X=00 Y=00 P=06 ------Z-  stx 05
;083b ff 00 00 f3 2f 37 00100010 001 036   A9 01      LDA #$01       ;PC=083B SP=0100 A=FF X=00 Y=00 P=06 ------Z-  lda #01
;083d 01 00 00 f3 2f 37 00100000 001 038   85 06      STA $06        ;PC=083D SP=0100 A=01 X=00 Y=00 P=04 --------  sta 06
;083f 01 00 00 f3 2f 37 00100000 001 041   86 07      STX $07        ;PC=083F SP=0100 A=01 X=00 Y=00 P=04 --------  stx 07
;0841 01 00 00 f3 2f 37 00100000 001 044   A0 03      LDY #$03       ;PC=0841 SP=0100 A=01 X=00 Y=00 P=04 --------  ldy #03
;0843 01 00 03 f3 2f 37 00100000 001 046   B1 02      LDA ($02),Y    ;PC=0843 SP=0100 A=01 X=00 Y=03 P=04 --------  lda (02),Y
;0845 ff 00 03 f3 2f 37 10100000 001 051   38         SEC            ;PC=0845 SP=0100 A=FF X=00 Y=03 P=84 N-------  sec
;0846 ff 00 03 f3 2f 37 10100001 001 053   E5 05      SBC $05        ;PC=0846 SP=0100 A=FF X=00 Y=03 P=85 N------C  sbc 05
;0848 ff 00 03 f3 2f 37 10100001 001 056   D0 2D      BNE $0877      ;PC=0848 SP=0100 A=FF X=00 Y=03 P=05 -------C  bne 0877
;0877 ff 00 03 f3 2f 37 10100001 001 059   50 04      BVC $087D      ;PC=0877 SP=0100 A=FF X=00 Y=03 P=05 -------C  bvc 087D
;087d ff 00 03 f3 2f 37 10100001 001 062   08         PHP            ;PC=087D SP=0100 A=FF X=00 Y=03 P=05 -------C  php
;087e ff 00 03 f2 2f 37 10100001 002 002   A0 04      LDY #$04       ;PC=087E SP=01FF A=FF X=00 Y=03 P=05 -------C  ldy #04
;0880 ff 00 04 f2 2f 37 00100001 002 004   48         PHA            ;PC=0880 SP=01FF A=FF X=00 Y=04 P=05 -------C  pha
;0881 ff 00 04 f1 2f 37 00100001 002 007   18         CLC            ;PC=0881 SP=01FE A=FF X=00 Y=04 P=05 -------C  clc
;0882 ff 00 04 f1 2f 37 00100000 002 009   98         TYA            ;PC=0882 SP=01FE A=FF X=00 Y=04 P=04 --------  tya
;0883 04 00 04 f1 2f 37 00100000 002 011   65 02      ADC $02        ;PC=0883 SP=01FE A=04 X=00 Y=04 P=04 --------  adc 02
;0885 00 00 04 f1 2f 37 00100011 002 014   85 02      STA $02        ;PC=0885 SP=01FE A=00 X=00 Y=04 P=07 ------ZC  sta 02
;0887 00 00 04 f1 2f 37 00100011 002 017   90 02      BCC $088B      ;PC=0887 SP=01FE A=00 X=00 Y=04 P=07 ------ZC  bcc 088B
;0889 00 00 04 f1 2f 37 00100011 002 019   E6 03      INC $03        ;PC=0889 SP=01FE A=00 X=00 Y=04 P=07 ------ZC  inc 03
;088b 00 00 04 f1 2f 37 10100001 002 024   68         PLA            ;PC=088B SP=01FE A=00 X=00 Y=04 P=85 N------C  pla
;088c ff 00 04 f2 2f 37 10100001 002 028   28         PLP            ;PC=088C SP=01FF A=FF X=00 Y=04 P=85 N------C  plp
;088d ff 00 04 f3 2f 37 10110001 002 032   10 06      BPL $0895      ;PC=088D SP=0100 A=FF X=00 Y=04 P=05 -------C  bpl 0895
;088f                                      A2 00      LDX #$00
;0891 ff 00 04 f3 2f 37 00110011 002 036   8A         TXA
;0892 00 00 04 f3 2f 37 00110011 002 038   4C 99 08   JMP $0899
;0899 00 00 04 f3 2f 37 00110011 002 041   F0 05      BEQ $08A0
;08a0 00 00 04 f3 2f 37 00110011 002 044   A9 00      LDA #$00
;08a2 00 00 04 f3 2f 37 00110011 002 046   4C 00 00   JMP $0000

;PC=0895 SP=0100 A=FF X=00 Y=04 P=05 -----I-C  ldx #00
;PC=0897 SP=0100 A=FF X=00 Y=04 P=07 -----IZC  lda #01
;PC=0899 SP=0100 A=01 X=00 Y=04 P=05 -----I-C  beq 08A0
;PC=089B SP=0100 A=01 X=00 Y=04 P=05 -----I-C  lda #01
;PC=089D SP=0100 A=01 X=00 Y=04 P=05 -----I-C  jmp 0000

.proc	_main: near

.segment	"CODE"

sp=2
sreg=4
ptr1=6

	lda #>$9000
	sta sp+1
	lda #<$9000
	sta sp
;
; if(long0 > 0)
;

		
	;lda     _long0+3
	lda	#$ff
	sta     sreg+1
;	lda     _long0+2
	lda	#$ff
	sta     sreg
;	ldx     _long0+1
	ldx	#$ff
;	lda     _long0
	lda	#$ff
		
	;jsr     pusheax
;pusheax:
        pha                     ; decsp will destroy A (but not X)
		
        ;jsr     decsp4
        lda     sp
        sec
        sbc     #4
        sta     sp
        bcc     @L1
;        rts
        bcs     @L2

@L1:    dec     sp+1
        ;rts
@L2:		
        ldy     #3
        lda     sreg+1
        sta     (sp),y
        dey
        lda     sreg
        sta     (sp),y
        dey
        txa
        sta     (sp),y
        dey
        pla
        sta     (sp),y
;        rts
	;end pusheax

	ldx     #$00
	stx     sreg
	stx     sreg+1
	lda     #$01

	;jsr     tosgeeax -> toslcmp/boolge
		
        ;jsr    	toslcmp	   	; Set the flags
        sta     ptr1
        stx     ptr1+1          ; EAX now in sreg:ptr1

        ldy     #$03
        lda     (sp),y
        sec
        sbc     sreg+1
        bne     L4

        dey
        lda     (sp),y
        cmp     sreg
        bne     L1

        dey
        lda     (sp),y
        cmp     ptr1+1
        bne     L1

        dey
        lda     (sp),y
        cmp     ptr1

L1:     php                     ; Save flags
        ;jsr     incsp4          ; Drop TOS
        ldy     #4
        ;jmp     addysp
addysp: pha                     ; Save A
        clc
        tya                     ; Get the value
        adc     sp              ; Add low byte
        sta     sp              ; Put it back
        bcc     @L1             ; If no carry, we're done
        inc     sp+1            ; Inc high byte
@L1:    pla                     ; Restore A
        ;rts
	;end incsp4
			
        plp                     ; Restore the flags
        beq     L2
        bcs     L3
        lda     #$FF            ; Set the N flag
L2:     rts

L3:     lda     #$01            ; Clear the N flag
        rts

L4:     bvc     L5
        eor     #$FF            ; Fix the N flag if overflow
        ora     #$01            ; Clear the Z flag
L5:     php                     ; Save flags

	;jsr     incsp4          ; Drop TOS
        ldy     #4
        ;jmp     addysp
addysp2: pha                     ; Save A
        clc
        tya                     ; Get the value
        adc     sp              ; Add low byte
        sta     sp              ; Put it back
        bcc     @L1             ; If no carry, we're done
        inc     sp+1            ; Inc high byte
@L1:    pla                     ; Restore A
        ;rts
	;end incsp4
			
        plp                     ; Restore flags
	;rts
	;end toslcmp

       	;jsr    	boolge		; Convert to boolean
boolge: bpl     ret1
L0:     ldx     #$00
        txa
        ;rts
	jmp boolgeend

ret1:   ldx     #$00
        lda     #$01
        ;rts
boolgeend:
	;end boolge
			
	beq     L00F5
;
; LOG_ERROR(1);
;
	lda     #$01
;	jsr     _run6502_logerror
	jmp 0	
;
L00F5:
	lda     #$0
	jmp 0	


	.endproc

.proc	_main4: near

.segment	"CODE"



;ADDR AC XR YR SP 00 01 NV-BDIZC LIN CYC
;0800 00 00 0a f3 2f 37 00100010 000 001
;0800 00 00 0a f3 2f 37 00100010 000 003   A9 7F      LDA #$7F
;0802 7f 00 0a f3 2f 37 00100000 000 005   38         SEC
;0803 7f 00 0a f3 2f 37 00100001 000 007   E9 81      SBC #$81
;0805 fe 00 0a f3 2f 37 11100000 000 009   70 02      BVS $0809
;0809 fe 00 0a f3 2f 37 11100000 000 012   10 05      BPL $0810
;080b fe 00 0a f3 2f 37 11100000 000 014   A9 00      LDA #$00
;080d 00 00 0a f3 2f 37 01100010 000 016   4C 00 00   JMP $0000
		

;PC=0802 SP=0100 A=7F X=00 Y=00 P=04 -----I--  sec
;PC=0803 SP=0100 A=7F X=00 Y=00 P=05 -----I-C  sbc #81
;PC=0805 SP=0100 A=FE X=00 Y=00 P=44 -V---I--  bvs 0809
;PC=0809 SP=0100 A=FE X=00 Y=00 P=44 -V---I--  bpl 0810
;PC=0810 SP=0100 A=FE X=00 Y=00 P=44 -V---I--  lda #01
;PC=0812 SP=0100 A=01 X=00 Y=00 P=44 -V---I--  jmp 0000

;
; if(char0 >= -0x7f)
;
;	lda     _char0
	lda	#$7f
	sec
	sbc     #$81
	bvs     L0015
	eor     #$80
L0015:	bpl     L0012
;
; result |= 1;
;
; run6502_putchar('0');
;
	lda #0
	jmp 0
;
; run6502_logerror(0);
;
L0012:

	lda #1
	jmp 0

.endproc





;ADDR AC XR YR SP 00 01 NV-BDIZC LIN CYC
;0800 00 00 0a f3 2f 37 00100010 000 003   A9 FF      LDA #$FF
;0802 ff 00 0a f3 2f 37 10100000 000 005   A2 FF      LDX #$FF
;0804 ff ff 0a f3 2f 37 10100000 000 007   C9 01      CMP #$01
;0806 ff ff 0a f3 2f 37 10100001 000 009   8A         TXA
;0807 ff ff 0a f3 2f 37 10100001 000 011   E9 00      SBC #$00
;0809 ff ff 0a f3 2f 37 10100001 000 013   70 02      BVS $080D
;080b ff ff 0a f3 2f 37 10100001 000 015   49 80      EOR #$80
;080d 7f ff 0a f3 2f 37 00100001 000 017   0A         ASL A
;080e fe ff 0a f3 2f 37 10100000 000 019   A9 00      LDA #$00
;0810 00 ff 0a f3 2f 37 00100010 000 021   A2 00      LDX #$00
;0812 00 00 0a f3 2f 37 00100010 000 023   2A         ROL A
;0813 00 00 0a f3 2f 37 00100010 000 025   F0 05      BEQ $081A
;081a 00 00 0a f3 2f 37 00100010 000 028   A9 00      LDA #$00
;081c 00 00 0a f3 2f 37 00100010 000 030   4C 00 00   JMP $0000



;PC=0800 SP=0100 A=00 X=00 Y=00 P=00 --1-----  lda #FF
;PC=0802 SP=0100 A=FF X=00 Y=00 P=84 N-1-----  ldx #FF
;PC=0804 SP=0100 A=FF X=FF Y=00 P=84 N-1-----  cmp #01
;PC=0806 SP=0100 A=FF X=FF Y=00 P=85 N-1----C  txa
;PC=0807 SP=0100 A=FF X=FF Y=00 P=85 N-1----C  sbc #00
;PC=0809 SP=0100 A=FF X=FF Y=00 P=45 -V1----C  bvs 080D
;PC=080D SP=0100 A=FF X=FF Y=00 P=45 -V1----C  asla
;PC=080E SP=0100 A=FE X=FF Y=00 P=C5 NV1----C  lda #00
;PC=0810 SP=0100 A=00 X=FF Y=00 P=47 -V1---ZC  ldx #00
;PC=0812 SP=0100 A=00 X=00 Y=00 P=47 -V1---ZC  rola
;PC=0813 SP=0100 A=01 X=00 Y=00 P=44 -V1-----  beq 081A
;PC=0815 SP=0100 A=01 X=00 Y=00 P=44 -V1-----  lda #01
;PC=0817 SP=0100 A=01 X=00 Y=00 P=44 -V1-----  jmp 0000

.proc	_main3: near

.segment	"CODE"
		
;	lda     _int0
;	ldx     _int0+1
	lda #$ff
	ldx #$ff
	cmp     #$01
	txa
	sbc     #$00
	bvs     L0056
	eor     #$80
L0056:	asl     a
	lda     #$00
	ldx     #$00
	rol     a
	beq     L0054

	lda #1 ; error
	jmp 0
L0054:
	lda #0
	jmp 0

.endproc




;PC=0802 SP=0100 A=00 X=00 Y=00 P=06 -----IZ-  lda #7E
;PC=0804 SP=0100 A=7E X=00 Y=00 P=04 -----I--  ldx #00
;PC=0806 SP=0100 A=7E X=00 Y=00 P=06 -----IZ-  lda #7E
;PC=0808 SP=0100 A=7E X=00 Y=00 P=04 -----I--  cmp #81
;PC=080A SP=0100 A=7E X=00 Y=00 P=84 N----I--  lda #00
;PC=080C SP=0100 A=00 X=00 Y=00 P=06 -----IZ-  ldx #00
;PC=080E SP=0100 A=00 X=00 Y=00 P=06 -----IZ-  rola
;PC=080F SP=0100 A=00 X=00 Y=00 P=06 -----IZ-  beq 0816
;PC=0816 SP=0100 A=00 X=00 Y=00 P=06 -----IZ-  lda #01
;PC=0818 SP=0100 A=01 X=00 Y=00 P=04 -----I--  jmp 0000

.proc	_main2: near

.segment	"CODE"

	ldx     #$00
	lda     #$7E
;	sta     _char0
		
; if(0x7e >= -0x7f)
; {
	ldx     #$00
;	lda     _char0
	lda     #$7E
	cmp     #$81
	lda     #$00
	ldx     #$00
	rol     a
	beq     L0006
;
; this should be the case
;
	lda     #$00 ;ok
	jmp 0
;
; }
;
L0006:
	lda     #$01 ;error
	jmp 0

.endproc

