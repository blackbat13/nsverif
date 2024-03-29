SRC=$(wildcard *.ml *.mll)

.PHONY: clean

main.native: $(SRC)
	ocamlbuild -verbose  0 -package str -pkg unix -pp camlp4o $@

ifeq (comp,$(firstword $(MAKECMDGOALS)))
  COMP_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(COMP_ARGS):;@:)
endif

clean: 
	ocamlbuild -clean
	rm -f temp*
	rm -f *.cmo
	rm -f *.cmi
	rm -f main.native
