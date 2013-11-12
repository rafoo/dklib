
DKS = *.dk
DKOS = $(DKS:.dk=.dko)

.PHONY:	clean depend
.SUFFIXES: .dk .dko
.dk.dko:
	dkcheck -e -nc $<

all: dk_records.dko dk_builtins.dko dk_monads.dko

depend: .depend
.depend:
	dkdep *.dk 2> /dev/null > .depend

clean:
	rm -f *.dko .depend

include .depend