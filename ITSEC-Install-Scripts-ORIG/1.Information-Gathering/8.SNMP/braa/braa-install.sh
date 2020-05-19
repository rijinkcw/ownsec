#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/mteg/braa.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/8.SNMP/braa/mteg/braa
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/8.SNMP/braa/mteg
EXECUTEABLE1=braa
EXECUTEABLE2=braa
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/8.SNMP/braa
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/8.SNMP/braa
DSKTPFL=braa.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/8.SNMP/braa

BANNER () {
	echo "${bold}
	 ____  ____      _        _    
	| __ )|  _ \    / \      / \   
	|  _ \| |_) |  / _ \    / _ \  
	| |_) |  _ <  / ___ \  / ___ \ 
	|____/|_| \_\/_/   \_\/_/   \_\

	INSTALL
	${normal}"
}

BANNER
GITCLONEFUNC
GITSBMDLINIT
make -j 4
CHMODXEX1
SYMLINKEX2TO1
CPDESKTFL