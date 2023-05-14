* LIFEG1R 2023-05-14
* 128 X 64, 1 BIT/PIXEL
	ORG	$4000
ZB	JMP	START
	FDB	ZE-ZB
* SET VDG TO MODE G1R
START	CLR	V0SET
	CLR	V0CLR+2
	CLR	V0CLR+4
* SET CONTROL REG FOR G1R
* COLOUR SET 1
	LDA	PIA1+2
	ANDA	#7
	ORA	#$98
	STA	PIA1+2
* PAGE 0 @ $7600
* PAGE 1 @ $7A00
* SPACE FOR STACK @ $7F00
* HI:RES GRAPHICS PAGE 0
* $7600/$200=$3B=00111011
	CLR	F0SET
	CLR	F0SET+2
	CLR	F0CLR+4
	CLR	F0SET+6
	CLR	F0SET+8
	CLR	F0SET+10
	CLR	F0CLR+12
* REQUIRED EQUATES
PG0	EQU	$7600
PG1	EQU	$7A00
PGSZ	EQU	$0400
PGRWSZ	EQU	$10
CPYBT	EQU	0
* INCLUDE CORE ROUTINE
	INCLUDE	LIFECORE.asm
* INCLUDES
	INCLUDE	RND.asm
	INCLUDE	ROMS.asm
	INCLUDE	TBLGEN.asm
	* ASSERT, PLEASE?
	* CANNOT RESOLVE ON 1ST PASS
	*IFLE PG0-POPCNT-128
	*ERROR "HIT GRAPHICS MEM!"
	*ENDC
ZE	EQU	*
	END	ZB
