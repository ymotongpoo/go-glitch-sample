#!/bin/bash

export GOPATH=$PWD
export GO111MODULE=on

echo "start.sh: run format, commit and go run"
gofmt -w ~/src && git commit -am 'gofmt' && refresh
cd ~/src
/tmp/go/bin/go run main.go
