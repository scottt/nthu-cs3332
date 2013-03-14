DIRS := hw1

.PHONY: all clean
all:
	for i in $(DIRS); do \
		cd $$i; make ; \
	done

clean:
	for i in $(DIRS); do \
		cd $$i; make clean ; \
	done
