#!/usr/bin/env bash

BRANCH=18.04-bionic_beaver
GITREPO=git://github.com/alphaaurigae/tor_ppa-install.git
GITREPOROOT=/opt/ownsec/0.Initial/src/PT2/3.UsrApp_Install/tor_ppa-install
GITCLONEDIR=/opt/ownsec/0.Initial/src/PT2/3.UsrApp_Install
EXEC1=tor_ppa-install.sh

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

# directory of the deps.txt file, default this repo
sed -i -e 's#APTLSTDIR=/home/$USER/tor_ppa-install#APTLSTDIR=/opt/ownsec/0.Initial/src/PT2/3.UsrApp_Install/tor_ppa-install#g' $EXEC1

./$EXEC1
