APP=$(shell basename $(shell git remote get-url origin))
REGISTRY=tovmariupol
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
#TARGETOS=linux
#TARGETARCH=arm64 #amd64

TARGETOS=$(shell echo ${TargetOS})
TARGETARCH=$(shell echo ${TargetArch})
REPO_NAME="europe-west3-docker.pkg.dev/robotic-weft-462808-a2/k8s-learn"
APP_NAME="kbot"
IMG_VER="v1.0.4"
IMAGE_NAME="${REPO_NAME}/${APP_NAME}:${IMG_VER}"

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

linux: format get
        CGO_ENABLED=0 GOOS=linux GOARCH=${TARGETARCH} go  build  -v -o kbot -ldflags "-X="github.com/tovmariupol-vysh/kbot/cmd.appVersion=${VERSION}

arm: format get
        CGO_ENABLED=0 GOOS=arm GOARCH=${TARGETARCH} go  build  -v -o kbot -ldflags "-X="github.com/tovmariupol-vysh/kbot/cmd.appVersion=${VERSION}

macOS: format get
        CGO_ENABLED=0 GOOS=macOS GOARCH=${TARGETARCH} go  build  -v -o kbot -ldflags "-X="github.com/tovmariupol-vysh/kbot/cmd.appVersion=${VERSION}

Windows: format get
        CGO_ENABLED=0 GOOS=windows GOARCH=${TARGETARCH} go  build  -v -o kbot -ldflags "-X="github.com/tovmariupol-vysh/kbot/cmd.appVersion=${VERSION}

image:
	docker build -t ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH} .	

push:
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}
clean:
	rm -rf kbot
	docker rmi $(shell docker images -q -f dangling=true)
	docker rmi ${IMAGE_NAME}
