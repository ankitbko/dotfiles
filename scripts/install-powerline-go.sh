#!/bin/bash

if [ -f "/usr/local/go/bin/go" ]; then
  echo "GO exists"
else
  VERSION="1.14.3"
  PLATFORM="linux-amd64"
  PACKAGE_NAME="go$VERSION.$PLATFORM.tar.gz"
  curl -o "$HOME/downloads/$PACKAGE_NAME"  https://dl.google.com/go/$PACKAGE_NAME
  sudo tar -C /usr/local -xzf $HOME/downloads/$PACKAGE_NAME
fi

if ! [ -x "$(command -v go)" ]; then
  export PATH=$PATH:/usr/local/go/bin:/$GOPATH/bin
fi

go get -u github.com/justjanne/powerline-go

# powerline-fonts
git clone https://github.com/powerline/fonts.git --depth=1 /tmp/powerline-fonts
sudo /tmp/powerline-fonts/install.sh
rm -rf /tmp/powerline-fonts
