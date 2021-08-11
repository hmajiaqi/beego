#!/bin/bash
cd `dirname $1`

sysgopath=$GOPATH

export GO111MODULE=on
export GOPROXY=https://goproxy.cn

APPNAME=app.bin
if [ "$2" != "" ]; then
    APPNAME=$2.app.bin
fi

GOOS=linux GOARCH=amd64 go build -o ../../bin/$APPNAME

if [ $? != 0 ]; then
    exit 1
fi

export GOPATH=$sysgopath