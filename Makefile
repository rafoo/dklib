
DKS = *.dk
DKOS = $(DKS:.dk=.dko)

.PHONY:	clean depend
.SUFFIXES: .dk .dko
.dk.dko:
	dkcheck -e -nc -r $<

all: dk_records.dko dk_builtins.dko dk_monads.dko

depend: .depend
.depend:
	dkdep *.dk > .depend

clean:
	rm -f *.dko .depend

-include .depend
