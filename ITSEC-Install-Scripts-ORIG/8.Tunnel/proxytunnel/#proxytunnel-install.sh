#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/proxytunnel/proxytunnel
GITREPOROOT=/opt/ITSEC/8.Tunnel/proxytunnel/proxytunnel/proxytunnel
GITCLONEDIR=/opt/ITSEC/8.Tunnel/proxytunnel/proxytunnel
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/proxytunnel
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/proxytunnel
DSKTPFL=proxytunnel.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/proxytunnel
BANNER () {
	echo "${bold}
	 ____  ____   _____  ____   _______ _   _ _   _ _   _ _____ _     
	|  _ \|  _ \ / _ \ \/ /\ \ / /_   _| | | | \ | | \ | | ____| |    
	| |_) | |_) | | | \  /  \ V /  | | | | | |  \| |  \| |  _| | |    
	|  __/|  _ <| |_| /  \   | |   | | | |_| | |\  | |\  | |___| |___ 
	|_|   |_| \_\\___/_/\_\  |_|   |_|  \___/|_| \_|_| \_|_____|_____|
		  
	INSTALL
	${normal}"
}

BANNER
GITCLONEFUNC
make clean
GITSBMDLINIT
make -j 4
sudo make install
CPDESKTFL