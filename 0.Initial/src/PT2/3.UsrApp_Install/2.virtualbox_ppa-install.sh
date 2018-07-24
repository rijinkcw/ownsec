#!/bin/bash

BRANCH=18.04-bionic_beaver
GITREPO=git://github.com/alphaaurigae/virtualbox_ppa-install.git
GITREPOROOT=/opt/ownsec/0.Initial/src/PT2/3.UsrApp_Install/virtualbox_ppa-install
GITCLONEDIR=/opt/ownsec/0.Initial/src/PT2/3.UsrApp_Install
EXEC1=Virtualbox_ppa-Install.sh

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

# directory of the deps.txt file, default this repo
sed -i -e 's#APTLSTDIR=/home/$USER/virtualbox_ppa-install#APTLSTDIR=/opt/ownsec/0.Initial/src/PT2/3.UsrApp_Install/virtualbox_ppa-install#g' $EXEC1

./$EXEC1
