
DKS = $(wildcard *.dk)
DKOS = $(DKS:.dk=.dko)
DKDEPENDS = $(DKS:.dk=.dk.depend)

DKDEP ?= dkdep
DKCHECK ?= dkcheck
DKCHECK_OPTIONS =
CSIHO_PATH =
ifeq ($(CSIHO_PATH),)
  DKCHECK_CONFLUENCE_OPTION =
else
  DKCHECK_CONFLUENCE_OPTION = -cc $(CSIHO_PATH)
endif

.PHONY:	clean depend

all: $(DKOS)

%.dko:
	$(DKCHECK) -e $(DKCHECK_CONFLUENCE_OPTION) $(DKCHECK_OPTIONS) $<

# dk_monads and dk_monads_coc use non-linear rules so we deactivate
# confluence checking for those files and activate the relevant options
dk_monads.dko:
	$(DKCHECK) -e $(DKCHECK_OPTIONS) -nl $<
dk_monads_coc.dko:
	$(DKCHECK) -e $(DKCHECK_OPTIONS) -nl -coc $<

# dk_binary_nat is too hard for the confluence checker
dk_binary_nat.dko:
	$(DKCHECK) -e $(DKCHECK_OPTIONS) $<
# dk_char, dk_string, dk_builtins depend on it
dk_char.dko:
	$(DKCHECK) -e $(DKCHECK_OPTIONS) $<
dk_string.dko:
	$(DKCHECK) -e $(DKCHECK_OPTIONS) $<
dk_builtins.dko:
	$(DKCHECK) -e $(DKCHECK_OPTIONS) $<


# so is dk_int
dk_int.dko:
	$(DKCHECK) -e $(DKCHECK_OPTIONS) $<


# foo.dk.depend lists the modules foo depends on
%.dk.depend: %.dk
	$(DKDEP) $< > $@

depend: $(DKDEPENDS)

clean:
	rm -f *.dko *.depend tmp.dk

-include $(DKDEPENDS)
