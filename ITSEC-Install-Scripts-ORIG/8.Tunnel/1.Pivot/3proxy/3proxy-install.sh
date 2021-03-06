#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/z3APA3A/3proxy
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/1.Pivot/3proxy/z3APA3A/3proxy
GITCLONEDIR=/opt/ITSEC/8.Tunnel/1.Pivot/3proxy/z3APA3A
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/1.Pivot/3proxy
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/1.Pivot/3proxy
DSKTPFL=3proxy.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/1.Pivot/3proxy

BANNER () {
	echo "${bold}
	 _____ ____  ____   _____  ____   __
	|___ /|  _ \|  _ \ / _ \ \/ /\ \ / /
	  |_ \| |_) | |_) | | | \  /  \ V / 
	 ___) |  __/|  _ <| |_| /  \   | |  
	|____/|_|   |_| \_\\___/_/\_\  |_|  
		 
	INSTALL
	${normal}"
}

BANNER
GITCLONEFUNC
make clean
GITSBMDLINIT
make -f makefile.unix
CPDESKTFL

