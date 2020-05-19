#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/justmao945/mallory.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/mallory/justmao945/mallory
GITCONFDIR=/opt/ITSEC/8.Tunnel/mallory/justmao945/mallory/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/mallory/justmao945
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/mallory
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/mallory
DSKTPFL=mallory.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/mallory

BANNER () {
	echo "${bold}
	 __  __    _    _     _     ___  ______   __
	|  \/  |  / \  | |   | |   / _ \|  _ \ \ / /
	| |\/| | / _ \ | |   | |  | | | | |_) \ V / 
	| |  | |/ ___ \| |___| |__| |_| |  _ < | |  
	|_|  |_/_/   \_\_____|_____\___/|_| \_\|_|  
		  
	INSTALL
	${normal}"
}

BANNER
GITCLONEFUNC
GITSBMDLINIT