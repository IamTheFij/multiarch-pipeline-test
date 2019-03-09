DOCKER_TAG ?= multiarch-test-${USER}

.PHONY: default
default: test

.PHONY:test
test:
	@echo ok

.PHONY: build
build: build/qemu-x86_64-static
	docker build . -t ${DOCKER_TAG}

build/qemu-arm-static:
	./get_qemu.sh

build/qemu-x86_64-static:
	./get_qemu.sh

build/qemu-aarch64-static:
	./get_qemu.sh

.PHONY: cross-build-arm
cross-build-arm: build/qemu-arm-static
	docker build --build-arg REPO=arm32v6 --build-arg ARCH=arm . -t ${DOCKER_TAG}-arm32v6

.PHONY: run
run: build
	docker run ${DOCKER_TAG}

.PHONY: run
cross-run-arm: cross-build-arm
	docker run --rm ${DOCKER_TAG}-arm32v6
