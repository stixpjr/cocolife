* RND:1 2021-07-08
* 8:BIT RANDOM NUMBER
* GENERATOR
* RANDOM RETURNED IN A
* TOTAL: 49 CYCLES
* ANNOTATED WITH CYCLES
* USES DIRECT ADDRESSING
* (DP REG) FOR SPEED
	SETDP	$0
RNDA	EQU	$0
RNDB	EQU	$1
RNDC	EQU	$2
RNDX	EQU	$3
RND	INC	RNDX	6
	LDA	RNDA	4
	EORA	RNDC	4
	EORA	RNDX	4
	STA	RNDA	4
	ADDA	RNDB	4
	STA	RNDB	4
	LSRA		2
	ADDA	RNDC	4
	EORA	RNDA	4
	STA	RNDC	4
	RTS		5