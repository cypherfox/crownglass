# Directory, where all required tools are located (absolute path required)
BUILD_PATH ?= $(shell pwd)
TOOLS_DIR  ?= $(shell cd tools 2>/dev/null && pwd)


VERSION    := 0.2.1-dev3
TIME       := $(shell date)
GO_MODULE  := github.com/cypherfox/crownglass
GO_VERSION := 1.18
LDFLAGS    := "-extldflags=-static -X '$(GO_MODULE)/pkg/version.BuildTime=$(TIME)' -X '$(GO_MODULE)/pkg/version.BuildVersion=$(VERSION)'"



bin/crownglass-cli: main.go cmd/init.go cmd/project.go cmd/root.go Makefile
	CGO_ENABLED=0 go build -o bin/crownglass-cli -ldflags=$(LDFLAGS) .

include go.mk


