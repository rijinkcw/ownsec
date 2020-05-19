#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/anestisb/WeBaCoo
BRANCH=master
GITREPOROOT=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/webacoo/anestisb/WeBaCoo
GITCLONEDIR=/opt/ITSEC/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/webacoo/anestisb
EXECUTEABLE1=webacoo.pl
EXECUTEABLE2=webacoo
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/webacoo
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/webacoo
DSKTPFL=webacoo.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/9.Maintain-Access/1.OS-Backdoors/0.MultiOS-Backdoor/webacoo

BANNER () {
	echo "${bold}
	__        _______ ____    _    ____ ___   ___  
	\ \      / / ____| __ )  / \  / ___/ _ \ / _ \ 
	 \ \ /\ / /|  _| |  _ \ / _ \| |  | | | | | | |
	  \ V  V / | |___| |_) / ___ \ |__| |_| | |_| |
	   \_/\_/  |_____|____/_/   \_\____\___/ \___/ 
		  
	INSTALL
	${normal}"
}

DEPS () {
	sudo apt-get update
	sudo apt-get upgrade
	xargs -a <(awk '/^\s*[^#]/' "$APTLSTDIR/deps-webacoo.txt") -r -- sudo apt-get install -y
}


BANNER
GITCLONEFUNC
DEPS
GITSBMDLINIT
chmod +x $EXECUTEABLE1
SYMLINKEX2TO1
CPDESKTFL
