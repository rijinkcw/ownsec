#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/ThomasHabets/arping.git
BRANCH=arping-2.x
GITREPOROOT=/opt/ITSEC/1.Information-Gathering/2.Live-Host/arping/ThomasHabets/arping
GITCLONEDIR=/opt/ITSEC/1.Information-Gathering/2.Live-Host/arping/ThomasHabets
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/arping
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/2.Live-Host/arping
DSKTPFL=arping.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/1.Information-Gathering/2.Live-Host/arping

BANNER () {
	echo "${bold}
	    _    ____  ____ ___ _   _  ____ 
	   / \  |  _ \|  _ \_ _| \ | |/ ___|
	  / _ \ | |_) | |_) | ||  \| | |  _ 
	 / ___ \|  _ <|  __/| || |\  | |_| |
	/_/   \_\_| \_\_|  |___|_| \_|\____|
		 
	INSTALL
	${normal}"
}

BUILD () {
	./bootstrap.sh
	./configure
	make -j 4
}

BANNER
GITCLONEFUNC
make clean 
GITSBMDLINIT
BUILD
sudo make install
CPDESKTFL