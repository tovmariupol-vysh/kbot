APP=$(shell basename $(shell git remote get-url origin))
REGISTRY=tovmariupol
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETOS=linux
TARGETARCH=arm64 #amd64

get:
	go get 

format:
	gofmt -s -w ./
lint:
	golint
test:
	go test -v 

build: format get
	CGO_ENABLED=0 GOOS=$(TARGETOS) GOARCH=${TARGETARCH} go  build  -v -o kbot -ldflags "-X="github.com/tovmariupol-vysh/kbot/cmd.appVersion=${VERSION}

image:
	docker build -t ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH} .	

push:
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}
clean:
	rm -rf kbot