ONT=bspo
OBO=http://purl.obolibrary.org/obo
DATE=$(shell date +'%Y-%m-%d')
OBODATE=$(shell date +'%d:%m:%Y %H:%M')
PREFIX=$(OBO)/$(ONT)
RELEASEPREFIX=$(PREFIX)/releases/$(DATE)

all: bspo.owl bspo.obo bspo-base.owl

bspo-base.owl: bspo-edit.obo
	robot annotate -i $< --ontology-iri $(PREFIX)/$(ONT)-base.owl --version-iri $(RELEASEPREFIX)/$(ONT)-base.owl --annotation oboInOwl:date "$(OBODATE)" -o $@

bspo.owl: bspo-base.owl
	robot reason -i $< --reasoner hermit annotate --ontology-iri $(PREFIX).owl --version-iri $(RELEASEPREFIX)/$(ONT).owl -o $@

bspo.obo: bspo.owl
	robot convert -i $< -o $@
