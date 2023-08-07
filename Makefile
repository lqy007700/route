all: proto build docker run-docker

.PHONY: proto
proto:
	sudo docker run --rm -v $(shell pwd):$(shell pwd) -w $(shell pwd) zxnl/protoc --proto_path=. --micro_out=. --go_out=:. ./proto/route/route.proto

build:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 /usr/local/Cellar/go@1.19/1.19.11/bin/go build -o route *.go

docker:
	sudo docker build . -t zxnl/route:latest

run-docker:
	sudo docker run -p 8083:8083 -v /Users/lqy007700/Data/config:/root/.kube/config -v /Users/lqy007700/Data/code/go-application/go-paas/route/micro.log:/micro.log zxnl/route