.PHONY: build install dist sources srpm clean

PYTHON  := python
PROGRAM := jsonrpclib
PACKAGE := python-$(PROGRAM)
VERSION := $(shell sed -n s/[[:space:]]*Version:[[:space:]]*//p $(PACKAGE).spec)


sources: clean
	@git archive --format=tar --prefix="$(PROGRAM)-$(VERSION)/" \
		$(shell git rev-parse --verify HEAD) | gzip > "$(PROGRAM)-$(VERSION).tar.gz"

clean:
	@rm -rf build dist $(PROGRAM).egg-info $(PROGRAM)-*.tar.gz *.egg *.src.rpm
