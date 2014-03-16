all: pull submodule make-children

pull:
	git pull origin master

submodule:
	git submodule update --remote --init

make-children:
	for d in */; do \
		( cd $$d && [ -e Makefile ] && make; ) \
	done

