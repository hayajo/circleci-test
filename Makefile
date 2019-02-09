BIN := circleci-test
VERSION = 0.0.10

.PHONY: all
all: version

.PHONY: check-release-deps
check-release-deps:
	@have_error=0; \
	for command in cpanm hub ghch gobump; do \
	  if ! command -v $$command > /dev/null; then \
	    have_error=1; \
	    echo "\`$$command\` command is required for releasing"; \
	  fi; \
	done; \
	test $$have_error = 0

.PHONY: release
release: check-release-deps
	(cd script && cpanm -qn --installdeps .)
	perl script/create-release-pullrequest

.PHONY: version
version:
	echo $(VERSION)
