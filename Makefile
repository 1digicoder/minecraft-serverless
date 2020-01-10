.EXPORT_ALL_VARIABLES:
SHELL := /bin/bash
MINECRAFT_VERSION=1.15.1
MINECRAFT_FILENAME=minecraft_server.${MINECRAFT_VERSION}.jar

GIT_URL=git://github.com/1digicoder/minecraft-serverless.git
GIT_HASH=$$(git ls-remote --heads $(GIT_URL) $1 | awk '{print $$1}')

DOCKER_IMAGE=minecraft-serverless

BUILD_ITEMS=./workspace/${MINECRAFT_FILENAME} ./workspace/start.sh

./workspace/${MINECRAFT_FILENAME}:
	./scripts/download-server.sh

./workspace/start.sh:
	./scripts/generate-start.sh ${MINECRAFT_VERSION}

.PHONY: build

build: ${BUILD_ITEMS}
	docker build -t ${DOCKER_IMAGE}:${GIT_HASH} .

.PHONY: clean

clean:
	rm ${BUILD_ITEMS}