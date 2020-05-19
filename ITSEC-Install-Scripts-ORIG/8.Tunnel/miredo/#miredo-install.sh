#!/bin/bash

#bug https://unix.stackexchange.com/questions/219152/pkglibexecdir-is-not-a-legitimate-directory

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/darconeous/miredo.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/miredo/darconeous/miredo
GITCLONEDIR=/opt/ITSEC/8.Tunnel/miredo/darconeous
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/miredo
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/miredo
DSKTPFL=miredo.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/miredo

BANNER () {
	echo "${bold}
	 __  __ ___ ____  _____ ____   ___  
	|  \/  |_ _|  _ \| ____|  _ \ / _ \ 
	| |\/| || || |_) |  _| | | | | | | |
	| |  | || ||  _ <| |___| |_| | |_| |
	|_|  |_|___|_| \_\_____|____/ \___/ 
		  
	INSTALL
	${normal}"
}

BANNER
GITCLONEFUNC
GITSBMDLINIT
./autogen.sh
