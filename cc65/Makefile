DEVPREFIX=~/Desktop/cc65/github/cc65
CC=$(DEVPREFIX)/bin/cc65
AS=$(DEVPREFIX)/bin/ca65
LD=$(DEVPREFIX)/bin/ld65
AR=$(DEVPREFIX)/bin/ar65
CL=$(DEVPREFIX)/bin/cl65

all:
	cp $(DEVPREFIX)/lib/apple2.lib run6502.lib

	$(AR) d run6502.lib crt0.o
	$(AR) d run6502.lib write.o
	$(AR) d run6502.lib read.o
	$(AR) d run6502.lib rwcommon.o
	$(AR) d run6502.lib open.o
	$(AR) d run6502.lib close.o
	$(AR) d run6502.lib fwrite.o

	$(CL) -t none -c run6502.s -o run6502.o
	$(CL) -t none -c crt0.s -o crt0.o
	$(CL) -t none -c write.s -o write.o
	$(CL) -t none -c read.s -o read.o
	$(CL) -t none -c rwcommon.s -o rwcommon.o
	$(CL) -t none -c fwrite.c -o fwrite.o

	$(AR) a run6502.lib crt0.o
	$(AR) a run6502.lib read.o
	$(AR) a run6502.lib rwcommon.o
	$(AR) a run6502.lib write.o
	$(AR) a run6502.lib fwrite.o
	$(AR) a run6502.lib run6502.o

clean:
	rm -f *.o *.lib *.prg *.bin *~