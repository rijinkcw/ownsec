#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/roman-rybalko/swaks.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/7.SMTP/swaks/roman-rybalko/swaks
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/7.SMTP/swaks/roman-rybalko
EXECUTEABLE1=swaks
EXECUTEABLE2=swaks
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/7.SMTP/swaks
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/7.SMTP/swaks
DSKTPFL=swaks.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt

BANNER () {
	echo "${bold}
	 ______        ___    _  ______  
	/ ___\ \      / / \  | |/ / ___| 
	\___ \\ \ /\ / / _ \ | ' /\___ \ 
	 ___) |\ V  V / ___ \| . \ ___) |
	|____/  \_/\_/_/   \_\_|\_\____/ 
		    
	INSTALL
	${normal}"

}

BANNER
GITCLONEFUNC
GITSBMDLINIT
CHMODXEX1
SYMLINKEX2TO1
CPDESKTFL