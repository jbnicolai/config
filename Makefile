all: init update pull-master checkout-master link

init:
	git submodule init

update:
	git submodule update

pull-master:
	git submodule foreach git pull origin master

checkout-master:
	git submodule foreach git checkout master

link:
	for dir in `find . -maxdepth 1 -type d -not -name ".*"`; do \
		if [ -e $$dir"/Makefile" ] ; then \
			cd $$dir; \
			make; \
			cd ..; \
		fi \
	done

