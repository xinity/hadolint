# Set an output prefix, which is the local directory if not specified
#GIT_BRANCH=$(shell git rev-parse --abbrev-ref HEAD)

.PHONY: all clean image binary

all: clean binary

clean:
		@echo "+ $@"
		@rm -rf bundles

image:
		@echo "+ $@"
		@docker build -t hadolint:test -f Dockerfile.build .

binary: image
		@echo "+ $@"
		$(eval C_ID := $(shell docker create hadolint:test))
		@docker start -a ${C_ID}
		@docker cp ${C_ID}:/root/.local/bin .
