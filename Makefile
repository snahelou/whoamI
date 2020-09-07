.PHONY: default build image check publish-images

TAG_NAME := $(shell git tag -l --contains HEAD)
VERSION=$(shell git describe --tags)
BUILD=$(shell date +%FT%T%z)

default: check test build

test:
	go test -v -cover ./...

build:

	CGO_ENABLED=0 go build -a --installsuffix cgo --ldflags="-s -X main.Version=$(VERSION) -X main.Build=$(BUILD)" -o whoami

image:
	docker build -t containous/whoami .

check:
	golangci-lint run

publish-images:
	seihon publish -v "$(TAG_NAME)" -v "latest" --image-name containous/whoami --dry-run=false
