#!/bin/bash -i

BRANCH=18.04-bionic_beaver
GITREPO=git://github.com/alphaaurigae/go-install.git
GITREPOROOT=/opt/DEPS/go-install
GITCLONEDIR=/opt/DEPS
EXEC1=go-apt-install.sh

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

# gopath
sed -i -e 's#GOPATH="/home/$USER/go#GOPATH="/home/$USER/go#g' $EXEC1

# goroot
sed -i -e 's#GOROOT="/usr/lib/go-1.9#GOROOT="/usr/lib/go-1.9#g' $EXEC1


./$EXEC1
