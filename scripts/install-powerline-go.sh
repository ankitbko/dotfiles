#!/bin/bash

if [ -f "/usr/local/go/bin/go" ]; then
  echo "GO exists"
else
  VERSION="1.14.3"
  PLATFORM="linux-amd64"
  PACKAGE_NAME="go$VERSION.$PLATFORM.tar.gz"
  curl -o "$HOME/downloads/$PACKAGE_NAME"  https://dl.google.com/go/$PACKAGE_NAME
  tar -C /usr/local -xzf $PACKAGE_NAME
fi

go get -u github.com/justjanne/powerline-go
sudo apt-get install fonts-powerline
