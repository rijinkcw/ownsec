#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/vecna/sniffjoke.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/7.Mitm/sniffjoke/vecna/sniffjoke
GITCLONEDIR=/opt/ITSEC/7.Mitm/sniffjoke/vecna
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/sniffjoke
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm/sniffjoke
DSKTPFL=sniffjoke.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/7.Mitm/sniffjoke

BANNER () {
	echo "${bold}
	 ____  _   _ ___ _____ _____   _  ___  _  _______ 
	/ ___|| \ | |_ _|  ___|  ___| | |/ _ \| |/ / ____|
	\___ \|  \| || || |_  | |_ _  | | | | | ' /|  _|  
	 ___) | |\  || ||  _| |  _| |_| | |_| | . \| |___ 
	|____/|_| \_|___|_|   |_|  \___/ \___/|_|\_\_____|
		 
	INSTALL
	${normal}"
}

BANNER
GITCLONEFUNC
sudo rm -r build
GITSBMDLINIT
mkdir build
cd build
cmake ..
make -j 4
sudo make install
CPDESKTFL