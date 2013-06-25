all: bspo.owl


bspo-step1.owl: bspo-edit.obo
	owltools $< -o file://`pwd`/$@

bspo-step2.owl: bspo-step1.owl
	grep -v '<oboInOwl:shorthand' $< > $@

bspo.owl: bspo-step2.owl
	ontology-release-runner $< --reasoner hermit --outdir . --allow-overwrite --simple --asserted
