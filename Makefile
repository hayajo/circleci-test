BIN := circleci-test
VERSION = 0.0.5

all: version

check-release-deps:
	@have_error=0; \
	for command in cpanm hub ghch gobump; do \
	  if ! command -v $$command > /dev/null; then \
	    have_error=1; \
	    echo "\`$$command\` command is required for releasing"; \
	  fi; \
	done; \
	test $$have_error = 0

release: check-release-deps
	(cd script && cpanm -qn --installdeps .)
	perl script/create-release-pullrequest

version:
	echo $(VERSION)

.PHONY: release version

