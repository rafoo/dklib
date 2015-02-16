
DKS = $(wildcard *.dk)
DKOS = $(DKS:.dk=.dko)

DKDEP = dkdep
DKCHECK = dkcheck
DKCHECK_OPTIONS =

.PHONY:	clean depend

%.dko:
	$(DKCHECK) -e $(DKCHECK_OPTIONS) $<

all: $(DKOS)

depend: .depend
.depend:
	$(DKDEP) *.dk > .depend

clean:
	rm -f *.dko .depend tmp.dk

-include .depend
