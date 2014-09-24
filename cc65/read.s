;
; Ullrich von Bassewitz, 16.11.2002
;
; int read (int fd, void* buf, unsigned count);
;

        .export         _read
        .constructor    initstdin

	.import		_run6502_getchar
	.import		_run6502_putchar

 ;       .import         SETLFS, OPEN, CHKIN, BASIN, CLRCH, READST
       .import         rwcommon
        .import         popax
        .import         __oserror
        .importzp       ptr1, ptr2, ptr3, tmp1, tmp2, tmp3

        .include        "fcntl.inc"
 ;       .include        "cbm.inc"
        .include        "filedes.inc"

;	.include	"kernalio.inc"
;	.import unittab

;--------------------------------------------------------------------------
; initstdin: Open the stdin file descriptors for the keyboard
			    
; FIXME: we dont read from stdin using the kernal, so this is unneeded...
; FIXME: however, things stop working if omitted ?

.segment        "INIT"

.proc   initstdin

        lda     #LFN_READ
        sta     fdtab+STDIN_FILENO
        lda     #STDIN_FILENO + LFN_OFFS
;        ldx     #CBMDEV_KBD
	ldx	#0
;        stx     unittab+STDIN_FILENO
        ldy     #$FF
 ;       jsr     SETLFS
 ;       jmp     OPEN            ; Will always succeed
	rts

.endproc

;--------------------------------------------------------------------------
; _read

.code

.proc   _read

;	jsr 	claim_kernalio

        jsr     rwcommon        ; Pop params, check handle
;        bcs     errout          ; Invalid handle, errno already set


 ;       lda     ptr2
;	jsr	_run6502_putchar
 ;       lda     ptr2+1
;	jsr	_run6502_putchar
			
; Check if the LFN is valid and the file is open for writing

;        adc     #LFN_OFFS       ; Carry is already clear
;        tax
;        lda     fdtab-LFN_OFFS,x; Get flags for this handle
;        and     #LFN_READ       ; File open for writing?
;        beq     notopen

; Check the EOF flag. If it is set, don't read anything

;        lda     fdtab-LFN_OFFS,x; Get flags for this handle
;        bmi     eof

; Valid lfn. Make it the input file

;        jsr     CHKIN
;        bcs     error

; Go looping...

;       bcc     @L3             ; Branch always
       jmp     @L3             ; Branch always

; Read the next byte

;	jsr     BASIN
			
@L0:
	jsr	_run6502_getchar
        sta     tmp1            ; Save the input byte

	cmp #$ff
        beq     @L4             ; Jump if end of file reached
			
;	jsr	_run6502_putchar
			

;       jsr     READST          ; Read the IEEE status
;       sta     tmp3            ; Save it
;        and     #%10111111      ; Check anything but the EOI bit
;        bne     error5          ; Assume device not present

; Store the byte just read

;        lda     ptr2
;	jsr	_run6502_putchar
 ;       lda     ptr2+1
;	jsr	_run6502_putchar

			
        ldy     #0
        lda     tmp1
        sta     (ptr2),y
        inc     ptr2
        bne     @L1
        inc     ptr2+1          ; *buf++ = A;

; Increment the byte count

@L1:    inc     ptr3
        bne     @L2
        inc     ptr3+1

; Get the status again and check the EOI bit

@L2:
;	lda     tmp3
 ;       and     #%01000000      ; Check for EOI
  ;      bne     @L4             ; Jump if end of file reached

; Decrement the count

@L3:
	inc     ptr1
        bne     @L0
        inc     ptr1+1
        bne     @L0
        beq     done            ; Branch always

; Set the EOI flag and bail out

@L4:    ldx     tmp2            ; Get the handle
        lda     #LFN_EOF
        ora     fdtab,x
        sta     fdtab,x

; Read done, close the input channel

done:
	;jsr     CLRCH

; Return the number of chars read

eof:    lda     ptr3
        ldx     ptr3+1

;	jsr release_kernalio

        rts

; Error entry, file is not open

notopen:
        lda     #3              ; File not open
        bne     error

; Error entry, status not ok

error5: lda     #5              ; Device not present
error:  sta     __oserror
errout: lda     #$FF
        tax                     ; Return -1

;	jsr release_kernalio

        rts

.endproc



