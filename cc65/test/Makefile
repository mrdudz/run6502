 
all:
	cl65 -t none -C ../run6502.cfg main.c ../run6502.lib -o main.bin

	cl65 -Osir -t none -C ../run6502.cfg switch.c ../run6502.lib -o switch.bin
	cc65 -Osir --add-source -t none switch.c -o switch.s

testmain:
	../run6502 -l 0x07ff main.bin -P 0xff00 -G 0xff01  -E 0xff02 -X 0 -R 0x080d -t

test:
#	../run6502 -l 0x07ff main.bin -P 0xff00 -G 0xff01 -X 0 -R 0x080d
#	../run6502 -l 0x07ff switch.bin -P 0xff00 -G 0xff01 -E 0xff02  -X 0 -R 0x080d -t
	../run6502 -l 0x07ff switch.bin -P 0xff00 -G 0xff01 -E 0xff02  -X 0 -R 0x080d

testsw:
	cl65 -t none --start-addr 0x800 sw.s -o sw.bin
	../run6502 -l 0x800 sw.bin -P 0xff00 -G 0xff01 -X 0 -R 0x800 -t
	
testsw2:
	cl65 -t none --start-addr 0x800 sw2.s -o sw2.bin
	echo -n "XY" > sw2.prg
	cat sw2.bin >> sw2.prg
	../run6502 -l 0x800 sw2.bin -P 0xff00 -G 0xff01 -X 0 -R 0x800 -t
	
clean:
	rm -f *.o *.lib *.prg *.bin *~