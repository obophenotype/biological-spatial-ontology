## Customize Makefile settings for bspo
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

RELEASEPREFIX=$(ONTBASE)/releases/$(TODAY)

bspo-base.owl: bspo-edit.obo
	robot annotate -i $< --ontology-iri $(ONTBASE)/$@ $(ANNOTATE_ONTOLOGY_VERSION) --annotation oboInOwl:date "$(OBODATE)" -o $@

bspo.owl: bspo-base.owl
	robot reason -i $< --reasoner hermit annotate --ontology-iri $(ONTBASE).owl $(ANNOTATE_ONTOLOGY_VERSION) -o $@


