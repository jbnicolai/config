all: pull init update checkout-master pull-master link

pull:
	git pull origin master

init:
	git submodule init

update:
	git submodule update

checkout-master:
	git submodule foreach git checkout master

pull-master:
	git submodule foreach git pull origin master


link:
	for d in */; do \
		( cd $$d && [ -e Makefile ] && make; ) \
	done

