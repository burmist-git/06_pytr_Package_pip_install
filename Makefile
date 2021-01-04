PYTHONSETUPFILE=setup.py
PKGNAME := $(shell grep 'name=' ${PYTHONSETUPFILE} | sed 's/,//'| sed 's/name=//' | sed 's/"//g' | sed 's/ //g')
PKGVERSION := $(shell grep 'version=' ${PYTHONSETUPFILE} | sed 's/,//'| sed 's/version=//' | sed 's/"//g' | sed 's/ //g')
CONDAENVNAME=pkgttest
CONDAENVYML=${CONDAENVNAME}_env.yml

.PHONY: environmentsetup environmentsetupyml exportpkglist rmenv installpkg uninstallpkg printinfo clean printhelp

## Set up python interpreter environment via conda
environmentsetup:
	./Makefile_sh.sh --condaenv ${CONDAENVNAME}

## Set up python interpreter environment
environmentsetupyml:
	conda env create -f ${CONDAENVYML}

## Export packages list to yml file
exportpkglist:
	./Makefile_sh.sh --exportenv ${CONDAENVYML}

## remove conda environment
rmenv:
	./Makefile_sh.sh --condaenvrm ${CONDAENVNAME}

## pip install package
installpkg:
	./Makefile_sh.sh --pipinstall ${PKGNAME} ${PKGVERSION}

## pip uninstall package
uninstallpkg:
	pip uninstall -y ${PKGNAME}
	@echo conda list | grep ${PKGNAME} | wc -l

## Print info test
printinfo:
	@echo MAKEFILE_LIST = ${MAKEFILE_LIST}
	@echo PYTHONSETUPFILE = ${PYTHONSETUPFILE}
	@echo PKGNAME = ${PKGNAME}
	@echo PKGVERSION = ${PKGVERSION}
	@echo CONDAENVNAME = ${CONDAENVNAME}
	@echo CONDAENVYML = ${CONDAENVYML}

## Clean the folders from unused files and others (created by python) 
clean:
	rm -f *~
	rm -f .*~
	rm -f */*~
	rm -f */.*~
	rm -rf ${PKGNAME}.egg-info
	rm -rf .ipynb_checkpoints/
	rm -rf ./${PKGNAME}/.ipynb_checkpoints
	rm -rf ./${PKGNAME}/__pycache__

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
