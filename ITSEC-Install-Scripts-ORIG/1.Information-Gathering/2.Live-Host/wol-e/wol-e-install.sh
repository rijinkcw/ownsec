#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=git://git.kali.org/packages/wol-e.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/wol-e/dookie/wol-e
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/wol-e/dookie
EXECUTEABLE1=wol-e.py
EXECUTEABLE2=wol-e
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/wol-e
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/wol-e
DSKTPFL=wol-e.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/wol-e

BANNER () {
	echo "${bold}
	__        _____  _          _____ 
	\ \      / / _ \| |        | ____|
	 \ \ /\ / / | | | |   _____|  _|  
	  \ V  V /| |_| | |__|_____| |___ 
	   \_/\_/  \___/|_____|    |_____|
		    
	INSTALL
	${normal}"
}

BANNER
GITCLONEFUNC
GITSBMDLINIT
SYMLINKEX2TO1
CPDESKTFL

# foreman s