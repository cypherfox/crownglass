
test-fixture: generated/bin/cgfixture

generated/main.go:
	mkdir -p ./generated
	cd generated ; go mod init example.com/crownglass/cgfixture
	cd generated ; ../../../bin/crownglass-cli init
	cd generated ; go mod tidy

generated/bin/cgfixture: generated/main.go
	cd generated ; CGO_ENABLED=0 go build -o ./bin/cgfixture -ldflags=$(LDFLAGS) ./

clean:
	rm -rf ./generated