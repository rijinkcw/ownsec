#!/bin/bash -i

BRANCH=18.04-bionic_beaver
GITREPO=git://github.com/alphaaurigae/bash_installs.git
GITREPOROOT=/opt/DEPS/alphaaurigae/bash_installs/nvm_node-npm_install
GITCLONEDIR=/opt/DEPS
EXEC1=1.Install_NVM.sh
EXEC2=2.NVM_Install_NODE-NPM.sh

mkdir -p $GITCLONEDIR
cd $GITCLONEDIR
git clone -b $BRANCH $GITREPO
cd $GITREPOROOT

sed -i -e 's/NVM_VERS=v0.33.9/NVM_VERS=v0.33.9/g' $EXEC1
sed -i -e 's#NODE_VERS=v8.9.2#NODE_VERS=v8.9.2#g' $EXEC2

./$EXEC1
./$EXEC2