#!/bin/bash

set -e

export GOPATH=$PWD
export GO111MODULE=on
GO_ARCHIVE=go1.13.5.linux-amd64.tar.gz

echo "install.sh: initializing the project by installing ${GO_ARCHIVE}"

if [ ! -d /tmp/go ]; then
  cd /tmp
  if [ ! -f /tmp/${GO_ARCHIVE} ]; then
    wget -q https://dl.google.com/go/${GO_ARCHIVE}
  fi
  sha256sum -c ~/${GO_ARCHIVE}.SHA256SUMS || (echo "failed to verify go tarball" && rm /tmp/{$GO_ARCHIVE} && exit 1)
  tar -xzf ${GO_ARCHIVE}
  rm /tmp/${GO_ARCHIVE}
fi

mkdir -p /tmp/pkg
if [ ! -L pkg ]; then
  ln -s /tmp/pkg $GOPATH/pkg
fi
