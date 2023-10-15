UBUNTU_RELEASE = 23.10
DOCKER_IMAGE = darktable-build:$(UBUNTU_RELEASE)

all: Dockerfile
	docker build \
		--build-arg="UBUNTU_RELEASE=$(UBUNTU_RELEASE)" \
		-t $(DOCKER_IMAGE) \
		-f $< \
		.

build:
	docker run --rm \
		-v `pwd`:/app:rw \
		-w /app/darktable \
		$(DOCKER_IMAGE) make all build

shell:
	docker run --rm -it \
		-v `pwd`:/app:rw \
		-w /app/darktable \
		$(DOCKER_IMAGE) bash

.PHONY: all build shell
