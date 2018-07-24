#!/usr/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/alphaaurigae/backdoor-factory_install
BRANCH=18.04-bionic_beaver
GITREPOROOT=/opt/ownsec/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/the-backdoor-factory/backdoor-factory_install
GITCLONEDIR=/opt/ownsec/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/the-backdoor-factory

GITCLONEFUNC

./the-backdoor-factory_install.sh


