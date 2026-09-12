.PHONY: build shell run test test-module

export DOCKER_CLI_HINTS := false

COMPOSE := docker compose

build:
	$(COMPOSE) build

shell:
	$(COMPOSE) run --rm x86-harness

run:
	@test -n "$(MODULE)" || (echo "Usage: make run MODULE=00-hello"; exit 2)
	$(COMPOSE) run --rm x86-harness make -C src/$(MODULE) run

test:
	$(COMPOSE) run --rm x86-harness make -C tests all

test-module:
	@test -n "$(MODULE)" || (echo "Usage: make test-module MODULE=00-hello"; exit 2)
	$(COMPOSE) run --rm x86-harness make -C src/$(MODULE) test
