#!/bin/bash

# does not work 16.04 24-5-17

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/Zapotek/cdpsnarf.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/cdpsnarf/Zapotek/cdpsnarf
GITCLONEDIR=/opt/ITSEC/7.Mitm/cdpsnarf/Zapotek
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/cdpsnarf
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/cdpsnarf
DSKTPFL=cdpsnarf.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/cdpsnarf

BANNER () {
	echo "${bold}
	  ____ ____  ____  ____  _   _    _    ____  _____ 
	 / ___|  _ \|  _ \/ ___|| \ | |  / \  |  _ \|  ___|
	| |   | | | | |_) \___ \|  \| | / _ \ | |_) | |_   
	| |___| |_| |  __/ ___) | |\  |/ ___ \|  _ <|  _|  
	 \____|____/|_|   |____/|_| \_/_/   \_\_| \_\_|    
		
	INSTALL
	${normal}"
}

BANNER
GITCLONEFUNC
make clean
GITSBMDLINIT
make -j 4
#./cdpsnarf -h

CPDESKTFL

