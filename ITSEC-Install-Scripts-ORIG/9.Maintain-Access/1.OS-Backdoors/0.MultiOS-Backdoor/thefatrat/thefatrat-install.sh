#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/alphaaurigae/metasploit-framework_install
BRANCH=xenial
GITREPOROOT=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/thefatrat/thefatrat_install
GITCLONEDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/thefatrat

GITCLONEFUNC

./thefatrat-install.sh