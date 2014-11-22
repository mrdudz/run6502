DEVPREFIX=~/Desktop/cc65/github/cc65
CC=$(DEVPREFIX)/bin/cc65
AS=$(DEVPREFIX)/bin/ca65
LD=$(DEVPREFIX)/bin/ld65
AR=$(DEVPREFIX)/bin/ar65
LIBPREFIX=$(DEVPREFIX)/lib
CCINC=-I $(DEVPREFIX)/include

#DEVPREFIX=~/Desktop/cc65/cc65-old/cc65-2.12.0
#CC=$(DEVPREFIX)/src/cc65/cc65
#AS=$(DEVPREFIX)/src/ca65/ca65
#LD=$(DEVPREFIX)/src/ld65/ld65
#AR=$(DEVPREFIX)/src/ar65/ar65
#LIBPREFIX=$(DEVPREFIX)/libsrc
#CCINC=-I $(DEVPREFIX)/include

# CAUTION!!! DO NOT USE cl65 HERE, IT MAY NOT USE THE RIGHT SUBTOOLS

all:
	cp $(LIBPREFIX)/apple2.lib run6502.lib

	$(AR) d run6502.lib crt0.o
	$(AR) d run6502.lib write.o
	$(AR) d run6502.lib read.o
	$(AR) d run6502.lib rwcommon.o
	$(AR) d run6502.lib open.o
	$(AR) d run6502.lib close.o
	$(AR) d run6502.lib fwrite.o

	$(AS) -t none run6502.s -o run6502.o
	$(AS) -t none crt0.s -o crt0.o
	$(AS) -t none write.s -o write.o
	$(AS) -t none read.s -o read.o
	$(AS) -t none rwcommon.s -o rwcommon.o
# FIXME: rewrite this function in assembly, the include path may not
#        actually be whats expected depending on compiler version
	$(CC) -t none $(CCINC) fwrite.c -o fwrite.s
	$(AS) -t none fwrite.s -o fwrite.o
	rm -f fwrite.s

	$(AR) a run6502.lib crt0.o
	$(AR) a run6502.lib read.o
	$(AR) a run6502.lib rwcommon.o
	$(AR) a run6502.lib write.o
	$(AR) a run6502.lib fwrite.o
	$(AR) a run6502.lib run6502.o

clean:
	rm -f *.o *.lib *.prg *.bin *~
	rm -f fwrite.s
