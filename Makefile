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
	for dir in `find . -maxdepth 1 -type d -not -name ".*"`; do \
		if [ -e $$dir"/Makefile" ] ; then \
			cd $$dir; \
			make; \
			cd ..; \
		fi \
	done

