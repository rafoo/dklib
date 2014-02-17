
DKS = *.dk
DKOS = $(DKS:.dk=.dko)

.PHONY:	clean depend
.SUFFIXES: .dk .dko
.dk.dko:
	dkcheck -e -nc -r $<

all: dk_int.dko dk_fail.dko dk_opt.dko dk_builtins.dko dk_monads.dko dk_tuple.dko

depend: .depend
.depend:
	dkdep *.dk > .depend

clean:
	rm -f *.dko .depend

-include .depend
