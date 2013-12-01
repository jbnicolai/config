all: pull submodule-init submodule-fetch submodule-co-master make-children

pull:
	git pull origin master

submodule-init:
	git submodule init

submodule-fetch:
	git submodule foreach git fetch origin master

submodule-co-master:
	git submodule foreach git checkout master

make-children:
	for d in */; do \
		( cd $$d && [ -e Makefile ] && make; ) \
	done

