#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/kamorin/DHCPig
BRANCH=master
GITREPOROOT=/opt/ITSEC/10.Stresstest/dhcpig/kamorin/DHCPig
GITCLONEDIR=/opt/ITSEC/10.Stresstest/dhcpig/kamorin
EXECUTEABLE1=pig.py
EXECUTEABLE2=dhcPIG
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/dhcpig
DSKTPFLSDEST=/home/$USER/.local/share/applications/10.Stresstest/dhcpig
DSKTPFL=dhcpig.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/10.Stresstest/dhcpig

BANNER () {
	echo "${bold}
	 ____  _   _  ____ ____ ___ ____ 
	|  _ \| | | |/ ___|  _ \_ _/ ___|
	| | | | |_| | |   | |_) | | |  _ 
	| |_| |  _  | |___|  __/| | |_| |
	|____/|_| |_|\____|_|  |___\____|
		    
	INSTALL
	${normal}"
}

BANNER
GITCLONEFUNC
GITSBMDLINIT
CHMODXEX1
SYMLINKEX2TO1
CPDESKTFL