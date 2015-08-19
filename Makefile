
DKS = $(wildcard *.dk)
DKOS = $(DKS:.dk=.dko)
DKDEPENDS = $(DKS:.dk=.dk.depend)

DKDEP = dkdep
DKCHECK = dkcheck
DKCHECK_OPTIONS =

.PHONY:	clean depend

all: $(DKOS)

%.dko:
	$(DKCHECK) -e $(DKCHECK_OPTIONS) $<

dk_monads.dko:
	$(DKCHECK) -e $(DKCHECK_OPTIONS) -nl $<

dk_monads_coc.dko:
	$(DKCHECK) -e $(DKCHECK_OPTIONS) -nl -coc $<


%.dk.depend: %.dk
	$(DKDEP) $< > $@

depend: $(DKDEPENDS)

clean:
	rm -f *.dko *.depend tmp.dk

include $(DKDEPENDS)
