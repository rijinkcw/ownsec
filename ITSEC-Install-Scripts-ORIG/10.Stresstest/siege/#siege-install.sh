#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/JoeDog/siege
BRANCH=master
GITREPOROOT=/opt/ITSEC/10.Stresstest/siege/JoeDog/siege
GITCLONEDIR=/opt/ITSEC/10.Stresstest/siege/JoeDog
EXECUTEABLE1=siege
EXECUTEABLE2=siege
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/0.Initial/lst/apt

BANNER () {
	echo "${bold}
	 ____ ___ _____ ____ _____ 
	/ ___|_ _| ____/ ___| ____|
	\___ \| ||  _|| |  _|  _|  
	 ___) | || |__| |_| | |___ 
	|____/___|_____\____|_____|
		  
	INSTALL
	${normal}"
}

BANNER
GITCLONEFUNC
GITSBMDLINIT
CHMODXEX1
SYMLINKEX2TO1
