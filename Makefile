PREFIX ?= /usr/local
MAN_PREFIX ?= ${PREFIX}/man

all:
# Intentionally empty


install:
	install -d ${PREFIX}/bin
	install -c -m 555 try_repeat ${PREFIX}/bin
	install -d ${MAN_PREFIX}/man1
	install -c -m 444 try_repeat.1 ${MAN_PREFIX}/man1/try_repeat.1


clean:
# Intentionally empty


test:
	./test.sh


distrib:
	test "X`git status --porcelain`" = "X"
	@read v?'distrib version: ' \
	  && mkdir try_repeat-$$v \
	  && cp -rp COPYRIGHT LICENSE-APACHE LICENSE-MIT \
	    Makefile CHANGES.md README.md test.sh \
	    try_repeat try_repeat.1 \
	    try_repeat-$$v \
	  && tar cfz try_repeat-$$v.tgz try_repeat-$$v \
	  && rm -rf try_repeat-$$v
