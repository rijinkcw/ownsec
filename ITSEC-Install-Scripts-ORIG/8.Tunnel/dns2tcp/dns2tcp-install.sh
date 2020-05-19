#!/bin/bash

. /opt/ownsec/ITSEC-Install-Scripts-ORIG/001.functions/all-scripts.sh

GITREPO=https://github.com/risent/dns2tcp.git
BRANCH=master
GITREPOROOT=/opt/ITSEC/8.Tunnel/dns2tcp/risent/dns2tcp
GITCONFDIR=/opt/ITSEC/8.Tunnel/dns2tcp/risent/dns2tcp/.git
GITCLONEDIR=/opt/ITSEC/8.Tunnel/dns2tcp/risent
EXECUTEABLE1=dns2tcp
EXECUTEABLE2=dns2tcp
DSKTPFLS=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/dns2tcp
DSKTPFLSDEST=/home/$USER/.local/share/applications/8.Tunnel/dns2tcp
DSKTPFL=dns2tcp.desktop
APTLSTDIR=/opt/ownsec/ITSEC-Install-Scripts-ORIG/8.Tunnel/dns2tcp

BANNER () {
	echo "${bold}
	 ____  _   _ ____ ____ _____ ____ ____  
	|  _ \| \ | / ___|___ \_   _/ ___|  _ \ 
	| | | |  \| \___ \ __) || || |   | |_) |
	| |_| | |\  |___) / __/ | || |___|  __/ 
	|____/|_| \_|____/_____||_| \____|_|    
		    
	INSTALL                                 
	${normal}"
}

BANNER
GITCLONEFUNC
GITSBMDLINIT
go build
CHMODXEX1
SYMLINKEX2TO1
CPDESKTFL


