UBUNTU_RELEASE = 23.10
DOCKER_IMAGE = darktable-build:$(UBUNTU_RELEASE)

all: Dockerfile
	docker build \
		--build-arg="UBUNTU_RELEASE=$(UBUNTU_RELEASE)" \
		-t $(DOCKER_IMAGE) \
		-f $< \
		.

DOCKER_RUN = docker run --rm -it \
				-v `pwd`:/app:rw \
				-w /app/darktable \
				$(DOCKER_IMAGE)

build:
	$(DOCKER_RUN) make all build

shell:
	$(DOCKER_RUN) bash

.PHONY: all build shell
