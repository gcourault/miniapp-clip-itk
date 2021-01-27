CLIPROOT = /usr/local/clip
LANG = en_EN.CP437

CLIP	= $(CLIPROOT)/bin/clip
CLIPFLAGS = -a -O 
CLIPLIBS  = -lsuper

OBJS  = archivos.o \
	supmenu.o \
	i_mouse.o \
        compro.o 


.SUFFIXES: .prg .o .po

all: socios 

clean:
	rm -rf  *.o *.c *.a *.so *.pa *.log  *.b  *.bak *~  miniapp test


socios: miniapp.prg $(OBJS)
	$(CLIP) $(CLIPFLAGS) -s -e -M miniapp.prg $(OBJS) $(CLIPLIBS)


.prg.o:
	$(CLIP) $(CLIPFLAGS) $<

.prg.po:
	$(CLIP) $(CLIPFLAGS) -p $<

tar:
	tar czvf prg.tgz *.prg Makefile *.ch *.dat *.inc *.php 

