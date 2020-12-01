
########################################################################
# Date        : Thu Nov 26 18:04:31 CET 2020                           #
# Autor       : Leonid Burmistrov                                      #
# Description :                                                        #
########################################################################

.PHONY: printhelp printinfo installpkgttest uninstallpkgttest clean

## Set up python interpreter environment
environment:
	conda env create -f pkgttestenv.yml

## install pkgttest
installpkgttest:
	pip install -e .

## uninstall pkgttest
uninstallpkgttest:
	pip uninstall -y pkgttest

## remove env pkgttest
rmenvpkgttest:
	conda env remove -n pkgttest

## Print info test
printinfo:
	@echo ${MAKEFILE_LIST}

## Clean the folders from unused files and others (created by python) 
clean:
	rm -f *~
	rm -f .*~
	rm -f */*~
	rm -f */.*~
	rm -rf pkgttest.egg-info
	rm -rf .ipynb_checkpoints/
	rm -rf ./pkgttest/.ipynb_checkpoints/
	rm -rf ./pkgttest/__pycache__
	rm -rf ./outdir/.ipynb_checkpoints/

########################################################################
# Self Documenting Commands                                            #
# Copied with modification from :                                      #
# https://github.com/hgrif/example-project/blob/master/Makefile        #
########################################################################

.DEFAULT_GOAL := printhelp

## Self-Documented Makefile : print descriptions of the described commands
printhelp:
	@echo "$$(tput bold)Available rules:$$(tput sgr0)"
	@echo
	@sed -n -e "/^## / { \
		h; \
		s/.*//; \
		:doc" \
		-e "H; \
		n; \
		s/^## //; \
		t doc" \
		-e "s/:.*//; \
		G; \
		s/\\n## /---/; \
		s/\\n/ /g; \
		p; \
	}" ${MAKEFILE_LIST} \
	| LC_ALL='C' sort --ignore-case \
	| awk -F '---' \
		-v ncol=$$(tput cols) \
		-v indent=19 \
		-v col_on="$$(tput setaf 6)" \
		-v col_off="$$(tput sgr0)" \
	'{ \
		printf "%s%*s%s ", col_on, -indent, $$1, col_off; \
		n = split($$2, words, " "); \
		line_length = ncol - indent; \
		for (i = 1; i <= n; i++) { \
			line_length -= length(words[i]) + 1; \
			if (line_length <= 0) { \
				line_length = ncol - indent - length(words[i]) - 1; \
				printf "\n%*s ", -indent, " "; \
			} \
			printf "%s ", words[i]; \
		} \
		printf "\n"; \
	}'
