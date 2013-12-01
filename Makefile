all: pull submodule-init submodule-update make-children

pull:
	git pull origin master

submodule-init:
	git submodule init

submodule-update:
	git submodule update --remote

make-children:
	for d in */; do \
		( cd $$d && [ -e Makefile ] && make; ) \
	done

