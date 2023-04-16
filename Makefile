COMMON=		LIFECORE.ASM TBLGEN.ASM RND.ASM ROMS.ASM TSTPTN.ASM

all:		cocolife.dsk

clean:
		-rm -f *.bin *.ASM cocolife.dsk cocolife.dsk.bak

test:		lifeg2r.bin
		xroar -machine coco -load lifeg2r.bin

lifeg1r.bin:	LIFEG1R.ASM LIFECORE.ASM TBLGEN.ASM RND.ASM ROMS.ASM
		lwasm -9 -b -o $@ LIFEG1R.ASM

lifeg2r.bin:	LIFEG2R.ASM LIFECORE.ASM TBLGEN.ASM RND.ASM ROMS.ASM
		lwasm -9 -b -o $@ LIFEG2R.ASM

lifeg6r.bin:	LIFEG6R.ASM LIFECORE.ASM TBLGEN.ASM RND.ASM ROMS.ASM
		lwasm -9 -b -o $@ LIFEG6R.ASM

lif64x32.bin:	LIF64X32.ASM LIFECORE.ASM TBLGEN.ASM RND.ASM ROMS.ASM
		lwasm -9 -b -o $@ LIF64X32.ASM

cocolife.dsk:	lifeg1r.bin lifeg2r.bin lifeg6r.bin lif64x32.bin LIFEG1R.ASM LIFEG2R.ASM LIFEG6R.ASM LIF64X32.ASM ${COMMON}
		cp tmpl.dsk $@
		imgtool put coco_jvc_rsdos $@ LIFETBL.BAS LIFETBL.BAS --ftype=basic
		imgtool put coco_jvc_rsdos $@ LIFEG1R.ASM LIFEG1R.ASM --ftype=assembler --ascii=ascii
		imgtool put coco_jvc_rsdos $@ LIFEG2R.ASM LIFEG2R.ASM --ftype=assembler --ascii=ascii
		imgtool put coco_jvc_rsdos $@ LIFEG6R.ASM LIFEG6R.ASM --ftype=assembler --ascii=ascii
		imgtool put coco_jvc_rsdos $@ LIF64X32.ASM LIF64X32.ASM --ftype=assembler --ascii=ascii
		imgtool put coco_jvc_rsdos $@ LIFECORE.ASM LIFECORE.ASM --ftype=assembler --ascii=ascii
		imgtool put coco_jvc_rsdos $@ TBLGEN.ASM TBLGEN.ASM --ftype=assembler --ascii=ascii
		imgtool put coco_jvc_rsdos $@ RND.ASM RND.ASM --ftype=assembler --ascii=ascii
		imgtool put coco_jvc_rsdos $@ ROMS.ASM ROMS.ASM --ftype=assembler --ascii=ascii
		imgtool put coco_jvc_rsdos $@ TSTPTN.ASM TSTPTN.ASM --ftype=assembler --ascii=ascii
		imgtool put coco_jvc_rsdos $@ lifeg1r.bin lifeg1r.bin
		imgtool put coco_jvc_rsdos $@ lifeg2r.bin lifeg2r.bin
		imgtool put coco_jvc_rsdos $@ lifeg6r.bin lifeg6r.bin
		imgtool put coco_jvc_rsdos $@ lif64x32.bin lif64x32.bin

.SUFFIXES:	.asm .ASM

.asm.ASM:
		./asm2edtasm < $< > $@

LIFECORE.ASM:	TSTPTN.ASM
