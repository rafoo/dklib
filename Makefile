
DKS = $(wildcard *.dk)
DKOS = $(DKS:.dk=.dko)

.PHONY:	clean depend
.SUFFIXES: .dk .dko
.dk.dko:
	dkcheck -e -nc -r $<

all: $(DKOS)

depend: .depend
.depend:
	dkdep *.dk > .depend

clean:
	rm -f *.dko .depend

-include .depend
