#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/hardwaterhacker/URLCrazy.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/13.OSINT/urlcrazy/hardwaterhacker/URLCrazy
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/13.OSINT/urlcrazy/hardwaterhacker
EXECUTEABLE1=urlcrazy
EXECUTEABLE2=urlcrazy
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/13.OSINT/urlcrazy
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/13.OSINT/urlcrazy
DSKTPFL=urlcrazy.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/13.OSINT/urlcrazy

BANNER () {
	echo "${bold}
	 _   _ ____  _     ____ ____      _     _______   __
	| | | |  _ \| |   / ___|  _ \    / \   |__  /\ \ / /
	| | | | |_) | |  | |   | |_) |  / _ \    / /  \ V / 
	| |_| |  _ <| |__| |___|  _ <  / ___ \  / /_   | |  
	 \___/|_| \_\_____\____|_| \_\/_/   \_\/____|  |_|  
	INSTALL
	${normal}"

}

BANNER
GITCLONEFUNC
GITSBMDLINIT
CHMODXEX1
SYMLINKEX2TO1
CPDESKTFL